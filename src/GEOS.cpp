//===-- GEOS.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the GEOS's main functions. Which
/// are responsable for interfacing heuristics that want to explore, in a 
/// fast way, the otmization's space set. 
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Transforms/Scalar.h"

#include "CostEstimator/CostEstimator.h"

#include <cstdlib>

using namespace llvm;

Pass* GEOS::getPass(OptimizationKind OptChoosed) {
  switch(OptChoosed) {
    // --------------- Not Working
    //case sccp:
    //  return createsccppass();
    //case LoopInstSimplify:
    //  return createLoopInstSimplifyPass();
    //case PartiallyInlineLibCalls:
    //  return createPartiallyInlineLibCallsPass();
    //case LoadCombine:
    //  return createLoadCombinePass(); // PreserveCFG

    // ---------------- Change the CFG
    /*case SROA:
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
    case SeparateConstOffsetFromGEP:  // Maybe can change CFG
      return createSeparateConstOffsetFromGEPPass();
    case LICM:
      return createLICMPass();*/

    // ---------------- Does not change the CFG
    case SCCP:
      return createSCCPPass();
    case SROA:
      return createSROAPass();
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
/*    case LCSSA:
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
/*    case InstructionNamer:
      return createInstructionNamerPass();*/
    case Sink: 
      return createSinkingPass();  // PreservesCFG
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

  ProfileModule   *ModuleCopy = PModule.getCopy();
  Module          *MyModule   = ModuleCopy->getLLVMModule();

  Function *Func = MyModule->getFunction(FuncName);

  PM.run(*Func);

  ModuleCopy->repairFunctionProfiling(Func);

  return ModuleCopy; 
}

ProfileModule* 
GEOS::applyPasses(const ProfileModule& PModule, FunctionPassManager& PM) {
  ProfileModule *ModuleCopy = PModule.getCopy();
  Module        *MyModule   = ModuleCopy->getLLVMModule();

  for (auto& Func : *MyModule)
    PM.run(Func);

  ModuleCopy->repairProfiling();

  return ModuleCopy; 
}

double GEOS::
analyseFunctionCost(StringRef FuncName, const ProfileModule* PModule, 
    CostEstimatorOptions Opts) {

  assert(PModule->getLLVMModule()->getFunction(FuncName) != nullptr && 
      "There is no function with this name in the Module.");

  Module *MyModule = PModule->getLLVMModule();

  Function     *LLVMFunc = MyModule->getFunction(FuncName);
  assert(LLVMFunc != nullptr 
      && "Trying to access a LLVM Function that don't exist!");

  double Estimation = CostEstimator::getFunctionCost(FuncName, PModule, Opts);

  return Estimation;
}

double GEOS::
analyseCost(const ProfileModule* PModule, CostEstimatorOptions Opts) {
  double Estimation = 0;
  for (auto &Func : *PModule->getLLVMModule()) 
    Estimation += 
      CostEstimator::getFunctionCost(Func.getName(), PModule, Opts);

  return Estimation;
}

