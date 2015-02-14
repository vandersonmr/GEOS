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

#include "CostAnalysis.h"

#include <vector>

namespace {
  typedef struct CostEstimatorOptions {
    double BranchMispredictionFrequency = 0.1; 
    double BranchMispredictionCost = 30; 
    double CPUClockInGHz = 2;

    std::vector<CostAnalysisKind> AnalysisActivated;
  } CostEstimatorOptions;

  enum CostEstimatorOptionsSet {
    ArchSensitive, NonArchSensitive
  };

  ConstEstimatorOptions getOptionsFor(CostEstimatorOptionsSet S) {
    CostEstimatorOptions Opt;
    switch (S) {
      NonArchSensitive:
        // TODO
      ArchSensitive:
        // TODO
      default:
        Opt.BranchMispredictionFrequency = 0.1;
        Opt.BranchMispredictionCost = 40;
        Opt.CPUClockInGHz = 1.86;
        Opt.AnalysisActivated = 
          {CostAnalysisKind::Branch, CostAnalysisKind::Instruction, 
           CostAnalysisKind::Instruction, CostAnalysisKind::Call};  
    }
  } 
}
