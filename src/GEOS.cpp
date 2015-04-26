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

#include "CostEstimator/CostEstimator.h"

#include <cstdlib>
#include <sys/types.h> 
#include <sys/wait.h>  
#include <unistd.h>    

using namespace llvm;

void GEOS::init() {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();
  PassRegistry *Registry = PassRegistry::getPassRegistry();
  initializeCore(*Registry);
  initializeCodeGen(*Registry);
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

ProfileModule*
GEOS::applyPassesOnFunction(StringRef FuncName, const ProfileModule& PModule,
    PassSequence &PS) {

  assert(PModule.getLLVMModule()->getFunction(FuncName) != nullptr &&
      "There is no function with this name in the Module.");

  ProfileModule *ModuleCopy = PModule.getCopy();
  Module *MyModule = ModuleCopy->getLLVMModule();

  PassManager PM;
  FunctionPassManager FPM(MyModule);
  PS.populatePassManager(PM, FPM);

  Function *Func = MyModule->getFunction(FuncName);

  assert(Func != nullptr 
      && "Trying to access a LLVM Function that don't exist!");

  FPM.run(*Func);

  ModuleCopy->repairFunctionProfiling(Func);
  return ModuleCopy;
}

ProfileModule*
GEOS::applyPasses(const ProfileModule& PModule, PassSequence &PS) {
  ProfileModule *ModuleCopy = PModule.getCopy();
  Module *MyModule = ModuleCopy->getLLVMModule();

  PassManager PM;
  FunctionPassManager FPM(MyModule);
  PS.populatePassManager(PM, FPM);

  for (auto &Func : *MyModule)
    FPM.run(Func);

  ModuleCopy->repairProfiling();
  PM.run(*MyModule);
  ModuleCopy->repairProfiling();

  return ModuleCopy;
}

double GEOS::
analyseFunctionCost(StringRef FuncName, const ProfileModule* PModule,
    CostEstimatorOptions Opts) {

  assert(PModule->getLLVMModule()->getFunction(FuncName) != nullptr &&
      "There is no function with this name in the Module.");

  Module *MyModule = PModule->getLLVMModule();
  Function *LLVMFunc = MyModule->getFunction(FuncName);

  assert(LLVMFunc != nullptr
      && "Trying to access a LLVM Function that don't exist!");

  return CostEstimator::getFunctionCost(FuncName, PModule, Opts);
}

double GEOS::
analyseCost(const ProfileModule* PModule, CostEstimatorOptions Opts) {
  return CostEstimator::getModuleCost(PModule, Opts);
}

double GEOS::
getRealExecutionTime(const ProfileModule* PModule, ExecutionKind ExecKind) {
  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule);
  return ETM.getExecutionTime();
}

double GEOS::
getRealExecutionTimeWithArgs(const ProfileModule* PModule, 
    ExecutionKind ExecKind, std::vector<std::string> Argv, char* const* Envp) {
  ExecutionTimeMeasurer &ETM = 
    ExecutionFactory::createRuntimeMeasurer(ExecKind, PModule);
  return ETM.getExecutionTime(Argv, Envp);
}
