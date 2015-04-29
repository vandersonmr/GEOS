//===---- include/PassSequence.h - The Pass Sequence Manager  -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition and implementation of a sequence
/// of passes. 
///
//===----------------------------------------------------------------------===//
#ifndef PASSSEQUENCE_H
#define PASSSEQUENCE_H

#include "llvm/Pass.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/PassManager.h"

#include <stdio.h>
#include <vector>

/// \brief List of all possible function pass.
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

/// \brief Kinds of optimizations. None = O0, Small = O1, Standard = O2 and 
/// Aggressive = O3.
enum OptLevel {
  None, Small, Standard, Aggressive, Random
};

/// \brief The aim of this class is to manage a sequence of optimizations.
class PassSequence {
  private:
    /// \brief The sequence itself.
    std::vector<OptimizationKind> Opts;
    /// \brief Module size optimization level
    OptLevel OSize  = None;
    /// \brief Module optimization level (Note: not function passes).
    OptLevel OLevel = None;

    /// \brief Returns a number between the min and the max following an uniform
    /// distribution.
    int getRandom(int Min, int Max) const {
      std::random_device Rd;
      std::default_random_engine E1(Rd());
      std::uniform_int_distribution<int> uniform_dist(Min, Max);
      return uniform_dist(E1);
    }

    /// \brief Returns a random OptimizationKind.
    OptimizationKind getRandomOptimizationKind() {
      return static_cast<OptimizationKind>(
          getRandom(0, OptimizationKind::LoadCombine));
    }

    /// \brief Given an OptimizationKind this function returns the respective 
    /// instanciation for this optimization (Pass).
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
      
    /// \brief Inserts an Optimization in the end.
    void add(OptimizationKind P) {
      if (P == LoopRotate) 
        Opts.push_back(LoopReroll);
      if (P == LoopIdiom)
        Opts.push_back(LoopReroll);
      Opts.push_back(P);
    }

    /// \brief Populates the PassSequence with randomic optimizations.
    /// \param RandomSize when set as true make the function generate sequences
    /// with size in the range between 1 and NumOfOptimizations.
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
  
    unsigned size() const {
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

    /// \brief Returns a PassSequence of the same size of both PassSequences 
    /// (parameter and this). This PassSequences is created by a mix between 
    /// them. Where there is 50% chance for each pass to be from the first or 
    /// second sequence.  
    PassSequence crossOver(const PassSequence &Rhs) const {
      PassSequence Res;
      auto Irhs = Rhs.begin();
      for (auto Opt : Opts) { 
        int i = getRandom(1,10);
        if (i % 2 == 0) {
          Res.add(Opt);
        } else {
          Res.add(*Irhs);
        }
        Irhs++;
      }
      return Res;
    }
   
    /// \brief Same as crossOver. 
    PassSequence operator*(const PassSequence &Rhs) const {
      return this->crossOver(Rhs);
    }

    /// \brief Add all sequences from the second into the first.
    PassSequence operator+(const PassSequence &Rhs) const {
      PassSequence Res;
      for (auto Opt : Opts)
        Res.add(Opt);
      for (auto Opt : Rhs) 
        Res.add(Opt);
      return Res;
    }

    /// \brief Returns true if both sequences have the same passes and also in 
    /// the same order.
    bool operator==(const PassSequence &Rhs) const { 
      if (Rhs.size() != size()) return false;
      auto Irhs = Rhs.begin();
      bool Equal = true;
      for (auto Opt : Opts) { 
        Equal &= (*Irhs) == Opt;
        Irhs++;
        if (!Equal) return false;
      }
      return true;
    }

    bool operator!=(const PassSequence &Rhs) const { 
      return !((*this) == Rhs);
    }

    typedef std::vector<OptimizationKind>::iterator iterator;
    typedef std::vector<OptimizationKind>::const_iterator const_iterator;
    iterator begin() { return Opts.begin(); }
    const_iterator begin() const { return Opts.cbegin(); }
    iterator end() { return Opts.end(); }
    const_iterator end() const { return Opts.cend(); }
};

#endif
