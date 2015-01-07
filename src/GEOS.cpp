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

#include <cstdlib>

using namespace llvm;

ProfileModule* 
GEOS::applyPasses(const ProfileModule& PModule, FunctionPassManager& PM) {
  ProfileModule *ModuleCopy = PModule.getCopy();
  Module        *MyModule   = ModuleCopy->getLLVMModule();

  for (auto& Func : *MyModule)
    PM.run(Func);

  return ModuleCopy; 
}

double 
GEOS::analyseExecutionTime(const ProfileModule& PModule, AnalysisMethods Method, 
    StringRef DatabaseFilename = "") {
  AnalysisMethod *Analyser;

  switch (Method) {
    case hashM:
      if (!DatabaseFilename.empty())
        Analyser = new HashMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case hashWM:
      if (!DatabaseFilename.empty())
        Analyser = new HashWeightedMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case instM:
      Analyser = new InstructionMethod();
      break;
    case instCostM:
      Analyser = new InstructionCostMethod();
      break;
    case randM:
      Analyser = new RandomMethod();
      break;
    case freqM:
      Analyser = new FrequencyMethod();
      break;
    case hashPlusInstM:
      if (!DatabaseFilename.empty())
        Analyser = new InstructionPlusHashMethod(DatabaseFilename);
      else
        errs() << "For hashPlusInstM you must pass a database filename with" <<
          " -database\n";
      break;
    default:
      Analyser = new InstructionMethod();
      break;
  }

  double PerformanceMensurment = 0;

  Module *MyModule = PModule.getLLVMModule();

  for (auto &FreqFunc : PModule.getProfile()) {
    Function *LLVMFunc = MyModule->getFunction(FreqFunc->getName());
    assert(LLVMFunc != nullptr 
        && "Trying to access a LLVM Function that don't exist!");

    PerformanceMensurment += 
      Analyser->estimateExecutionTime(LLVMFunc, FreqFunc);
  }

  return PerformanceMensurment;
}

Pass* GEOS::getPass(OptimizationKind OptChoosed) {
  switch(OptChoosed) {
    case ConstantPropagation:
      return createConstantPropagationPass();
    case AlignmentFromAssumptions:
      return createAlignmentFromAssumptionsPass();
    //case SCCP:
    //  return createSCCPPass();
    case DeadInstElimination:
      return createDeadInstEliminationPass();
    case DeadCodeElimination:
      return createDeadCodeEliminationPass();
    case AggressiveDCE:
      return createAggressiveDCEPass();
    case SROA:
      return createSROAPass();
    case ScalarReplAggregates: 
      return createScalarReplAggregatesPass(); //PreservesCFG
    case InductionVariableSimplify:
      return createIndVarSimplifyPass();
    case InstructionCombining:
      return createInstructionCombiningPass();
    case LICM:
      return createLICMPass();
    //case LoopStrengthReduce:
    //  return createLoopStrengthReducePass();
    //case LoopUnswitch:
    //  return createLoopUnswitchPass();
    //case LoopInstSimplify:
    //  return createLoopInstSimplifyPass();
    //case LoopUnroll:
    //  return createLoopUnrollPass();
    //case LoopReroll:
    //  return createLoopRerollPass();
    //case LoopRotate:
    //  return createLoopRotatePass();
    //case LoopIdiom:
    //  return createLoopIdiomPass();
    case PromoteMemoryToRegister:
      return createPromoteMemoryToRegisterPass();
    //case DemoteRegisterToMemory:
    //  return createDemoteRegisterToMemoryPass();
    case Reassociate: 
      return createReassociatePass(); // PreservesCFG
    //case JumpThreading:
    //  return createJumpThreadingPass();
    //case CFGSimplification:
    //  return createCFGSimplificationPass();
    //case FlattenCFG:
    //  return createFlattenCFGPass();
    //case CFGStructurization:
    //  return createStructurizeCFGPass();
    //case BreakCriticalEdges:
    //  return createBreakCriticalEdgesPass();
    //case LoopSimplify:
    //  return createLoopSimplifyPass();
    //case TailCallElimination: // Maybe can change CFG
    //  return createTailCallEliminationPass();
    //case LowerSwitch: // Maybe can change CFG
    //  return createLowerSwitchPass();
    case LCSSA:
      return createLCSSAPass(); // PreservesCFG
    case EarlyCSE:
      return createEarlyCSEPass();
    case MergedLoadStoreMotion:
      return createMergedLoadStoreMotionPass();
    case GVN:
      return createGVNPass();
    case MemCpyOpt:
      return createMemCpyOptPass();
    //case LoopDeletion: // Maybe can change CFG
    //  return createLoopDeletionPass();
    case ConstantHoisting:
      return createConstantHoistingPass();
    case InstructionNamer:
      return createInstructionNamerPass();
    case Sink: 
      return createSinkingPass();  // PreservesCFG
    case LowerAtomic:
      return createLowerAtomicPass(); // PreservesCFG
    case ValuePropagation:
      return createCorrelatedValuePropagationPass();
    case InstructionSimplifier:
      return createInstructionSimplifierPass();
    //case PartiallyInlineLibCalls:
    //  return createPartiallyInlineLibCallsPass();
    //case ScalarizerPass: // Maybe can change CFG
    //  return createScalarizerPass();
    case AddDiscriminators:
      return createAddDiscriminatorsPass();
    //case SeparateConstOffsetFromGEP:  // Maybe can change CFG
    //  return createSeparateConstOffsetFromGEPPass();
    //case LoadCombine:
    //  return createLoadCombinePass(); // PreserveCFG
    default:
      return nullptr;
  }
}
