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

#ifndef GEOS_H
#define GEOS_H

#include "AnalysisMethod.h"
#include "ProfileModule.h"

#include "llvm/PassManager.h"

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

/// \brief This class is responsable for apply passes into a ProfileModule, which
/// contatains the LLVM code and the profiling information, and also analyse its
/// execution time. 
class GEOS {
  public:
    /// \brief Instantiates the specificated AnlysisMethod.
    ///
    /// \param First is the AnalysisMethod kind and the second is the database 
    /// file path.
    static AnalysisMethod* getAnalyser(AnalysisMethodKind, llvm::StringRef);

    /// \brief Returns the instanciation of the optimization choosed.
    static llvm::Pass* getPass(OptimizationKind);

    /// \brief Like applyPasses this function apply a set of passes to the 
    /// llvm module. However, it just apply those to an specific function. 
    ///
    /// \param the first param is the function name that the passes should be 
    /// applied. 
    static ProfileModule* applyPassesOnFunction(llvm::StringRef,
        const ProfileModule&, llvm::FunctionPassManager&);

    /// \brief Apply Passes (Transformations) into a ProfileModule. Also ensures
    /// that its profiling information ramains consistent. The ProfileModule 
    /// given as parameter isn't modified, actualy all the modifications are
    /// made in a copy. This copy is returned as parameter.
    static ProfileModule* applyPasses(const ProfileModule&, 
        llvm::FunctionPassManager&);

    /// \brief Estimate the execution time of a function from the ProfileModule
    /// with the given AnalysisMethod and returns it.
    ///
    /// \param The first param is the name of the function that the analysis 
    /// should be done. 
    static double analyseFunctionExecutionTime(llvm::StringRef, 
        const ProfileModule&, AnalysisMethod*);

    /// \brief Estimate the execution time of a ProfileModule with the given 
    /// AnalysisMethod and returns it. 
    static double analyseExecutionTime(const ProfileModule&, AnalysisMethod*);
};

#endif
