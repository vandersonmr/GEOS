//===------- include/ProfileModule.h - The Profile Module  -*- C++ -*------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of the Profile Module, which
/// encapsulate a LLVMModule with profiling information. 
///
//===----------------------------------------------------------------------===//

#include "llvm/Pass.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/PassManager.h"

#include <stdio.h>
#include <vector>

enum OptimizationKind {
  ConstantPropagation,
  AlignmentFromAssumptions,
  SCCP,
  DeadInstElimination,
  DeadCodeElimination,
  DeadStoreElimination,
  AggressiveDCE,
  SROA,
  ScalarReplAggregates,
  InductionVariableSimplify,
  InstructionCombining,
  LICM,
  LoopStrengthReduce,
  LoopUnswitch,
  LoopInstSimplify,
  LoopUnroll,
  LoopReroll,
  LoopRotate,
  LoopIdiom,
  PromoteMemoryToRegister,
  DemoteRegisterToMemory,
  Reassociate,
  JumpThreading,
  CFGSimplification,
  FlattenCFG,
  CFGStructurization,
  BreakCriticalEdges,
  LoopSimplify,
  TailCallElimination,
  LowerSwitch,
  LowerInvoke,
  LCSSA,
  EarlyCSE,
  MergedLoadStoreMotion,
  GVN,
  MemCpyOpt,
  LoopDeletion,
  ConstantHoisting,
  InstructionNamer,
  Sink,
  LowerAtomic,
  ValuePropagation,
  InstructionSimplifier,
  LowerExpectInstrinsics,
  PartiallyInlineLibCalls,
  SampleProfilePass,
  ScalarizerPass,
  AddDiscriminators,
  SeparateConstOffsetFromGEP,
  LoadCombine
};

enum OptLevel {
  None, Small, Standard, Aggressive, Random
};

class PassSequence {
  private:
    std::vector<OptimizationKind> Opts;
    OptLevel OSize  = None;
    OptLevel OLevel = None;

    int getRandom(int Min, int Max) {
      std::random_device Rd;
      std::default_random_engine E1(Rd());
      std::uniform_int_distribution<int> uniform_dist(Min, Max);
      return uniform_dist(E1);
    }

    OptimizationKind getRandomOptimizationKind() {
      return static_cast<OptimizationKind>(
          getRandom(0, OptimizationKind::LoadCombine));
    }

    llvm::Pass* getPass(OptimizationKind OptChoosed) {
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
          return llvm::createSROAPass();
        case LoopStrengthReduce:
          return llvm::createLoopStrengthReducePass();
        case LoopUnswitch:
          return llvm::createLoopUnswitchPass();
        case LoopUnroll:
          return llvm::createLoopUnrollPass();
        case LoopReroll:
          return llvm::createLoopRerollPass();
        case LoopRotate:
          return llvm::createLoopRotatePass();
        case LoopIdiom:
          return llvm::createLoopIdiomPass();
        case JumpThreading:
          return llvm::createJumpThreadingPass();
        case CFGSimplification:
          return llvm::createCFGSimplificationPass();
        case FlattenCFG:
          return llvm::createFlattenCFGPass();
        case CFGStructurization:
          return llvm::createStructurizeCFGPass();
        case BreakCriticalEdges:
          return llvm::createBreakCriticalEdgesPass();
        case LoopSimplify:
          return llvm::createLoopSimplifyPass();
        case TailCallElimination: // Maybe can change CFG
          return llvm::createTailCallEliminationPass();
        case LowerSwitch: // Maybe can change CFG
          return llvm::createLowerSwitchPass();
        case LoopDeletion: // Maybe can change CFG
          return llvm::createLoopDeletionPass();
        case ScalarizerPass: // Maybe can change CFG
          return llvm::createScalarizerPass();
        case LICM:
          return llvm::createLICMPass();
        case SCCP:
          return llvm::createSCCPPass();
        case ConstantPropagation:
          return llvm::createConstantPropagationPass();
        case AlignmentFromAssumptions:
          return llvm::createAlignmentFromAssumptionsPass();
        case DeadInstElimination:
          return llvm::createDeadInstEliminationPass();
        case DeadCodeElimination:
          return llvm::createDeadCodeEliminationPass();
        case AggressiveDCE:
          return llvm::createAggressiveDCEPass();
        case ScalarReplAggregates:
          return llvm::createScalarReplAggregatesPass(); //PreservesCFG
        case InductionVariableSimplify:
          return llvm::createIndVarSimplifyPass();
        case InstructionCombining:
          return llvm::createInstructionCombiningPass();
        case PromoteMemoryToRegister:
          return llvm::createPromoteMemoryToRegisterPass();
        case DemoteRegisterToMemory:
          return llvm::createDemoteRegisterToMemoryPass();
        case Reassociate:
          return llvm::createReassociatePass(); // PreservesCFG
        case LCSSA:
          return llvm::createLCSSAPass(); // PreservesCFG*/
        case EarlyCSE:
          return llvm::createEarlyCSEPass();
        case MergedLoadStoreMotion:
          return llvm::createMergedLoadStoreMotionPass();
        case GVN:
          return llvm::createGVNPass();
        case MemCpyOpt:
          return llvm::createMemCpyOptPass();
        case ConstantHoisting:
          return llvm::createConstantHoistingPass();
        case Sink:
          return llvm::createSinkingPass(); // PreservesCFG
        case LowerAtomic:
          return llvm::createLowerAtomicPass(); // PreservesCFG
        case ValuePropagation:
          return llvm::createCorrelatedValuePropagationPass();
        case InstructionSimplifier:
          return llvm::createInstructionSimplifierPass();
        case AddDiscriminators:
          return llvm::createAddDiscriminatorsPass();
        default:
          return nullptr;
      }
    }

  public:
    void setOLevel(OptLevel OL) {
      OLevel = OL;
    }

    void setOSize(OptLevel OS) {
      OSize = OS; 
    }

    void add(OptimizationKind P) {
      if (P == LoopRotate) 
        Opts.push_back(LoopReroll);
//      if (P == InductionVariableSimplify)
//        Opts.push_back(LoopReroll);
      Opts.push_back(P);
    }

    void randomize(unsigned NumOfOptimizations, 
        bool RandomSize = false, OptLevel OL = None, OptLevel OS = None) {

      if (RandomSize) 
        NumOfOptimizations = getRandom(1, NumOfOptimizations); 

      setOLevel(OL == Random ? static_cast<OptLevel>(getRandom(1, 3)) : OL);
      setOSize(OS == Random ? static_cast<OptLevel>(getRandom(1, 3)) : OL);

      for (unsigned i = 0; i < NumOfOptimizations; i++) 
        add(getRandomOptimizationKind());
    }

    void populatePassManager(llvm::PassManager &PM, 
        llvm::FunctionPassManager &FPM) {
      llvm::PassManagerBuilder Builder;
      Builder.SizeLevel = static_cast<int>(OSize)  - 1;
      Builder.OptLevel  = static_cast<int>(OLevel) - 1;
      Builder.populateFunctionPassManager(FPM);
      Builder.populateModulePassManager(PM);

      for (auto Opt : Opts) {
        auto P = getPass(Opt);
        if (P != nullptr) 
          FPM.add(P);
      }
    }    

    unsigned size() {
      return Opts.size();
    }

    void print() {
      for (auto Opt : Opts) {
        auto P = getPass(Opt);
        if (P != nullptr) {
          printf("%s | ", P->getPassName());
          delete P;
        }
      }
      printf(" O%d | OSize = %d", OLevel, OSize);
      printf("\n");
    }
};
