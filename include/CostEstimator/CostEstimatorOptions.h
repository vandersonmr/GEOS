//===--- include/AnalysisMethod.h - Basic Block Cost Estimator -*- C++ -*--===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//
#ifndef COSTESTIMATOROPTIONS_H
#define COSTESTIMATOROPTIONS_H

#include <vector>

namespace {
  enum CostAnalysisKind {
    Cache, StaticInstruction, TTIInstruction, Branch, Call
  };

  typedef struct CostEstimatorOptions {
    double BranchMispredictionFrequency = 0.1; 
    double BranchMispredictionCost = 40; 
    double CPUClockInGHz = 1;

    std::vector<CostAnalysisKind> AnalysisActivated;
  } CostEstimatorOptions;

  enum CostEstimatorOptionsSet {
     NonArchSensitive, ArchSensitive
  };

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
