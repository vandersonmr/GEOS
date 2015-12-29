//== GEOS.cpp - Guide for Exploration of the Otimization's Space -*- C++ -*-==//
//
//              The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of GEOS's main functions. Which
/// are responsable for interfacing heuristics that want to explore, in a
/// fast way, the otmization's space set.
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/SourceMgr.h"

#include "CostEstimator/CostEstimator.h"

#include <cstdlib>
#include <unistd.h>
#include <sys/wait.h>

using namespace llvm;

void GEOS::init() {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();
  PassRegistry *Registry = PassRegistry::getPassRegistry();
  initializeCore(*Registry);
  initializeCodeGen(*Registry);
  initializeMachineDominatorTreePass(*Registry);
  initializeLoopStrengthReducePass(*Registry);
  initializeLowerIntrinsicsPass(*Registry);
  initializeUnreachableBlockElimPass(*Registry);
  initializeScalarOpts(*Registry);
  initializeObjCARCOpts(*Registry);
  initializeVectorization(*Registry);
  initializeIPO(*Registry);
  initializeAnalysis(*Registry);
  initializeIPA(*Registry);
  initializeTransformUtils(*Registry);
  initializeInstCombine(*Registry);
  initializeInstrumentation(*Registry);
  initializeTarget(*Registry);
  initializeCodeGenPreparePass(*Registry);
  initializeAtomicExpandPass(*Registry);
  initializeRewriteSymbolsPass(*Registry);
}

std::shared_ptr<ProfileModule>
GEOS::applyPassesOnFunction(StringRef FuncName, 
    const std::shared_ptr<ProfileModule> PModule, PassSequence &PS) {

  assert(PModule->getLLVMModule()->getFunction(FuncName) != nullptr &&
      "There is no function with this name in the Module.");

  std::shared_ptr<ProfileModule> ModuleCopy(PModule->getCopy());
  Module *MyModule = ModuleCopy->getLLVMModule();

  legacy::PassManager PM;
  legacy::FunctionPassManager FPM(MyModule);
  PS.populatePassManager(PM, FPM);

  Function *Func = MyModule->getFunction(FuncName);

  assert(Func != nullptr 
      && "Trying to access a LLVM Function that don't exist!");

  FPM.run(*Func);
  ModuleCopy->repairFunctionProfiling(Func);

  ModuleCopy->setPasses(PS);
  return ModuleCopy;
}

std::shared_ptr<ProfileModule>
GEOS::applyPasses(const std::shared_ptr<ProfileModule> PModule, 
    PassSequence &PS) {
  fflush(stdout);
  pid_t pid = fork();
  if (pid == 0) { 
    Module *MyModule = PModule->getLLVMModule();
    legacy::PassManager PM;
    legacy::FunctionPassManager FPM(MyModule);
    PS.populatePassManager(PM, FPM);

    for (auto &Func : *MyModule) 
      FPM.run(Func);

    PM.run(*MyModule);
    PModule->print(".tmp");
    exit(0);
  } 

  int ReturnStatus;
  waitpid(pid, &ReturnStatus, 0);
  if (ReturnStatus != 0) { 
    printf("Houston, We've Got a Problem! Our child have died!\n");
    return nullptr;
  } else {
    LLVMContext &Context = getGlobalContext();
    SMDiagnostic Error;
    Module *MyModule = 
      parseIRFile(".tmp", Error, Context).release();
    ProfileModule *ModuleCopy = new ProfileModule(MyModule);
    ModuleCopy->BBFreq.insert(PModule->BBFreq.begin(), PModule->BBFreq.end());
    ModuleCopy->repairProfiling();
    ModuleCopy->setPasses(PS);
    return std::shared_ptr<ProfileModule>(ModuleCopy);
  }
}

double GEOS::
analyseFunctionCost(StringRef FuncName, 
    const std::shared_ptr<ProfileModule> PModule, 
    CostEstimatorOptions Opts) {

  assert(PModule->getLLVMModule()->getFunction(FuncName) != nullptr &&
      "There is no function with this name in the Module.");

  Module *MyModule = PModule->getLLVMModule();
  Function *LLVMFunc = MyModule->getFunction(FuncName);

  if (LLVMFunc != nullptr)
    assert(false && "Trying to access a LLVM Function that don't exist!");

  return CostEstimator::getFunctionCost(FuncName, PModule.get(), Opts);
}

double GEOS::
analyseCost(const std::shared_ptr<ProfileModule> PModule, 
    CostEstimatorOptions Opts) {
  return CostEstimator::getModuleCost(PModule.get(), Opts);
}

double GEOS::
getRealExecutionTime(const std::shared_ptr<ProfileModule> PModule, 
    ExecutionKind ExecKind) {

  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule.get());
  return ETM.getExecutionTime();
}

double GEOS::
getRealExecutionTimeWithArgs(const std::shared_ptr<ProfileModule> PModule, 
    ExecutionKind ExecKind, std::vector<std::string> Argv, char* const* Envp) {
  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule.get());
  return ETM.getExecutionTime(Argv, Envp);
}

long long int* GEOS::
getPAPIProfile(const std::shared_ptr<ProfileModule> PModule, 
    ExecutionKind ExecKind, int* PAPIEvents, int Size) {
  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule.get());
  return ETM.getPAPIProfile(PAPIEvents, Size);
}

long long int* GEOS::
getPAPIProfileWithArgs(const std::shared_ptr<ProfileModule> PModule, 
    ExecutionKind ExecKind, std::vector<std::string> Argv, char* const* Envp,
    int *PAPIEvents, int Size) {

  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule.get());
  return ETM.getPAPIProfile(Argv, Envp, PAPIEvents, Size);
}
