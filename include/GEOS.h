//== GEOS.h - Guide for Exploration of the Otimization's Space  -*- C++ -*-===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of GEOS main functions. Which are 
/// responsable for interfacing with heuristics for otimization's set 
/// exploration. 
///
//===----------------------------------------------------------------------===//

#include "llvm/PassManager.h"

#include "ProfileModule/ProfileModule.h"
#include "CostEstimator/CostEstimatorOptions.h"
#include "RealExecutionTime/ExecutionTimeMeasurer.h"
#include "ProfileModule/PassSequence.h"

/// \brief This namespace is responsible for applying passes into a 
/// ProfileModule, analyse its execution time and make copies of it.
namespace GEOS {
  extern "C" {
    void init();

    /// \brief Like applyPasses this function applies a sequence of passes. 
    /// But differently from applyPasses this passes are just applied to the 
    /// function with the name given as parameter.
    ProfileModule* applyPassesOnFunction(llvm::StringRef,
        const ProfileModule&, PassSequence&);

    /// \brief This function applies a sequence of passes (Transformations) 
    /// into a ProfileModule. The passes are not applied into the 
    /// ProfileModule given as parameter, actually, all modifications are
    /// made in a copy and this copy is returned as parameter. Futher, it 
    /// ensures the profiling consistency.
    ProfileModule* applyPasses(const ProfileModule&, PassSequence&);

    /// \brief Estimate the execution time of a function, that the name is a 
    /// parameter, using the given AnalysisMethod and options.
    double analyseFunctionCost(llvm::StringRef, const ProfileModule*, 
        ::CostEstimatorOptions);

    /// \brief Estimate the execution time of a ProfileModule using the given 
    /// AnalysisMethod and options. 
    double analyseCost(const ProfileModule*, CostEstimatorOptions);

    /// \brief It runs the llvm code and returns its real runtime. 
    double getRealExecutionTime(const ProfileModule*, ExecutionKind);

    /// \brief It runs the llvm code and returns its real runtime. 
    /// Argv and Envp are parameters.
    double getRealExecutionTimeWithArgs(const ProfileModule*, 
        ExecutionKind, std::vector<std::string>, char* const*);
  }
}
