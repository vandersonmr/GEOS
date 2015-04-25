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
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/Transforms/Scalar.h"

#include "CostEstimator/CostEstimator.h"

#include <cstdlib>
#include <sys/time.h>

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

Pass* GEOS::getPass(OptimizationKind OptChoosed) {
  switch(OptChoosed) {
    // --------------- Not Working
    //case sccp:
    // return createsccppass();
    //case LoopInstSimplify:
    // return createLoopInstSimplifyPass();
    //case PartiallyInlineLibCalls:
    // return createPartiallyInlineLibCallsPass();
    //case LoadCombine:
    // return createLoadCombinePass(); // PreserveCFG
    //case SeparateConstOffsetFromGEP: // Maybe can change CFG
    //  return createSeparateConstOffsetFromGEPPass();
    // case InstructionNamer:
    //     return createInstructionNamerPass();
    // ---------------- Change the CFG
    case SROA:
      return createSROAPass();
    case LoopStrengthReduce:
      return createLoopStrengthReducePass();
    case LoopUnswitch:
      return createLoopUnswitchPass();
    case LoopUnroll:
      return createLoopUnrollPass();
    case LoopReroll:
      return createLoopRerollPass();
    case LoopRotate:
      return createLoopRotatePass();
    case LoopIdiom:
      return createLoopIdiomPass();
    case JumpThreading:
      return createJumpThreadingPass();
    case CFGSimplification:
      return createCFGSimplificationPass();
    case FlattenCFG:
      return createFlattenCFGPass();
    case CFGStructurization:
      return createStructurizeCFGPass();
    case BreakCriticalEdges:
      return createBreakCriticalEdgesPass();
    case LoopSimplify:
      return createLoopSimplifyPass();
    case TailCallElimination: // Maybe can change CFG
      return createTailCallEliminationPass();
    case LowerSwitch: // Maybe can change CFG
      return createLowerSwitchPass();
    case LoopDeletion: // Maybe can change CFG
      return createLoopDeletionPass();
    case ScalarizerPass: // Maybe can change CFG
      return createScalarizerPass();
    case LICM:
      return createLICMPass();
    case SCCP:
      return createSCCPPass();
    case ConstantPropagation:
      return createConstantPropagationPass();
    case AlignmentFromAssumptions:
      return createAlignmentFromAssumptionsPass();
    case DeadInstElimination:
      return createDeadInstEliminationPass();
    case DeadCodeElimination:
      return createDeadCodeEliminationPass();
    case AggressiveDCE:
      return createAggressiveDCEPass();
    case ScalarReplAggregates:
      return createScalarReplAggregatesPass(); //PreservesCFG
    case InductionVariableSimplify:
      return createIndVarSimplifyPass();
    case InstructionCombining:
      return createInstructionCombiningPass();
    case PromoteMemoryToRegister:
      return createPromoteMemoryToRegisterPass();
    case DemoteRegisterToMemory:
      return createDemoteRegisterToMemoryPass();
    case Reassociate:
      return createReassociatePass(); // PreservesCFG
    case LCSSA:
      return createLCSSAPass(); // PreservesCFG*/
    case EarlyCSE:
      return createEarlyCSEPass();
    case MergedLoadStoreMotion:
      return createMergedLoadStoreMotionPass();
    case GVN:
      return createGVNPass();
    case MemCpyOpt:
      return createMemCpyOptPass();
    case ConstantHoisting:
      return createConstantHoistingPass();
    case Sink:
      return createSinkingPass(); // PreservesCFG
    case LowerAtomic:
      return createLowerAtomicPass(); // PreservesCFG
    case ValuePropagation:
      return createCorrelatedValuePropagationPass();
    case InstructionSimplifier:
      return createInstructionSimplifierPass();
    case AddDiscriminators:
      return createAddDiscriminatorsPass();
    default:
      return nullptr;
  }
}

ProfileModule*
GEOS::applyPassesOnFunction(StringRef FuncName, const ProfileModule& PModule,
    FunctionPassManager& PM) {

  assert(PModule.getLLVMModule()->getFunction(FuncName) != nullptr &&
      "There is no function with this name in the Module.");

  ProfileModule *ModuleCopy = PModule.getCopy();
  Module *MyModule = ModuleCopy->getLLVMModule();

  Function *Func = MyModule->getFunction(FuncName);

  assert(Func != nullptr 
      && "Trying to access a LLVM Function that don't exist!");

  PM.run(*Func);

  ModuleCopy->repairFunctionProfiling(Func);
  return ModuleCopy;
}

ProfileModule*
GEOS::applyPasses(const ProfileModule& PModule, FunctionPassManager& PM) {
  ProfileModule *ModuleCopy = PModule.getCopy();
  Module *MyModule = ModuleCopy->getLLVMModule();

  for (auto& Func : *MyModule)
    PM.run(Func);

  ModuleCopy->repairProfiling();
  return ModuleCopy;
}

ProfileModule*
GEOS::applyPassesModule(const ProfileModule& PModule, FunctionPassManager& FPM,
    PassManager& PM) {

  ProfileModule *ModuleCopy = PModule.getCopy();
  Module *MyModule = ModuleCopy->getLLVMModule();

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

typedef unsigned long long timestampType;

static timestampType getTimestamp ()
{
  struct timeval now;
  gettimeofday (&now, NULL);
  return now.tv_usec + (timestampType) now.tv_sec * 1000000;
}


double GEOS::
getRealExecutionTime(const ProfileModule* PModule, ExecutionKind ExecKind, 
    char* const* envp) {
  switch(ExecKind) {
    case JIT:
      {
        auto Mod = PModule->getCopy()->getLLVMModule();
        std::string ErrStr;
        ExecutionEngine *EE = 
          EngineBuilder(std::unique_ptr<Module>(Mod)).create();
        Function *EntryFn = Mod->getFunction("main");
        if (!EntryFn) {                                                                                         
          errs() << "main function not found in module.\n";                                  
          return 0.0;                                                                                            
        }    
        EE->finalizeObject();
        typedef void (*PFN)();
        PFN pfn = reinterpret_cast<PFN>(EE->getPointerToFunction(EntryFn));
        timestampType T0 = getTimestamp();
        pfn();
        timestampType T1 = getTimestamp();
        double Secs = (T1 - T0) / 1000000.0L;
        delete EE;
        return Secs;
      }
    case Compiled:
      PModule->print(".tmp.ll");
      return 0.0;
  }
  return 0.0;
}
