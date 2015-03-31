//===-- include/CostEstimatorOptions.h - Cost Estimator Options-*- C++ -*--===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of structures that contains options
/// to customize the cost estimation analysis.
///
//===----------------------------------------------------------------------===//

#ifndef COSTESTIMATOROPTIONS_H
#define COSTESTIMATOROPTIONS_H

#include <vector>

namespace {
  /// \brief List of analysis methods
  enum CostAnalysisKind {
    Cache, StaticInstruction, TTIInstruction, Branch, Call
  };

  /// \brief This structure contain a vector with analysis and options for 
  /// them. It is used to inform to the CostEstimator how and which analysis 
  /// do.
  typedef struct CostEstimatorOptions {
    double BranchMispredictionFrequency = 0.1; 
    double BranchMispredictionCost = 40; 
    double CPUClockInGHz = 1;

    std::vector<CostAnalysisKind> AnalysisActivated;
  } CostEstimatorOptions;

  /// \brief List of groups of analysis.
  enum CostEstimatorOptionsSet {
     NonArchSensitive, ArchSensitive
  };

  /// \brief Given a type of group of analysis it returns a vector with all the 
  /// analysis from this group.
  std::vector<CostAnalysisKind> getAnalysisFor(CostEstimatorOptionsSet S) {
    switch (S) {
      default:
      case NonArchSensitive:
        return {CostAnalysisKind::StaticInstruction, 
            CostAnalysisKind::Call, CostAnalysisKind::Branch};
      case ArchSensitive:
        return {CostAnalysisKind::TTIInstruction, 
            CostAnalysisKind::Call, CostAnalysisKind::Branch, 
            CostAnalysisKind::Cache};  
    }
  } 
}

#endif
