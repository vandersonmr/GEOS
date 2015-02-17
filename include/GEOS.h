//== include/GEOS.h - Guide to Exploration of Otimization's Set  -*- C++ -*===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of GEOS main functions. 
/// Which are responsable for interfacing with heuristics for otimization's set
/// exploration. 
///
//===----------------------------------------------------------------------===//

#include "llvm/PassManager.h"

#include "ProfileModule/ProfileModule.h"
#include "CostEstimator/CostEstimatorOptions.h"

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

/// \brief This namespace is responsable for applying passes into a 
/// ProfileModule, which contains the LLVM code and the profiling information, 
/// and also analyse its execution time. 
namespace GEOS {
    extern "C" {
      /// \brief Returns the instanciation of the optimization choosed.
      llvm::Pass* getPass(OptimizationKind);

      /// \brief Like applyPasses this function apply a set of passes to the 
      /// llvm module. However, it just apply those to an specific function. 
      ///
      /// \param the first param is the function name that the passes should be 
      /// applied. 
      ProfileModule* applyPassesOnFunction(llvm::StringRef,const ProfileModule&,
          llvm::FunctionPassManager&);

      /// \brief Apply Passes (Transformations) into a ProfileModule. Also ensures
      /// that its profiling information ramains consistent. The ProfileModule 
      /// given as parameter isn't modified, actualy all the modifications are
      /// made in a copy. This copy is returned as parameter.
      ProfileModule* applyPasses(const ProfileModule&, 
          llvm::FunctionPassManager&);

      /// \brief Estimate the execution time of a function from the ProfileModule
      /// with the given AnalysisMethod and returns it.
      ///
      /// \param The first param is the name of the function that the analysis 
      /// should be done. 
      double analyseFunctionCost(llvm::StringRef, const ProfileModule*, 
          ::CostEstimatorOptions);

      /// \brief Estimate the execution time of a ProfileModule with the given 
      /// AnalysisMethod and returns it. 
      double analyseCost(const ProfileModule*, ::CostEstimatorOptions);
    }
}
