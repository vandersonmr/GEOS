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

#include "CostEstimatorOptions.h"
#include "ProfileModule.h"

namespace {
  enum CostAnalysisKind {
    Cache, Instruction, Branch, Call
  };

  class CostAnalysis {
    public:
      virtual double 
        estimateCost(const ProfileFunction&, CostEstimatorOptions) const = 0;
  };

  class CacheAnalysis : public AnalysisMethod {
    public:
      double 
        estimateCost(const ProfileFunction&, CostEstimatorOptions) const = 0;
  };

  class InstructionAnalysis : public AnalysisMethod {
    public:
      double 
        estimateCost(const ProfileFunction&, CostEstimatorOptions) const = 0;
  };

  class BranchAnalysis : public AnalysisMethod {
    public:
      double 
        estimateCost(const ProfileFunction&, CostEstimatorOptions) const = 0;
  };

  class CallAnalysis : public AnalysisMethod {
    public:
      double 
        estimateCost(const ProfileFunction&, CostEstimatorOptions) const = 0;
  };

  static std::unique_ptr<CostAnalysis> 
    createCostAnalysis(CostAnalysisKind Kind) {
      switch (Kind) {
        case Hash:
          return std::unique_ptr<CostAnalysis>(new CacheAnalysis());
        default:
        case Instruction:
          return std::unique_ptr<CostAnalysis>(new InstructionAnalysis());
        case Branch:
          return std::unique_ptr<CostAnalysis>(new BranchAnalysis());
        case Call:
          return std::unique_ptr<CostAnalysis>(new CallAnalysis());
      }
    } 
} //namespace
