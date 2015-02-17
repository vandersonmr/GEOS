//===--- include/CostAnalysis.h - Basic Block Cost Estimator -*- C++ -*--===//
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

#include "CostEstimator/CostEstimatorOptions.h"
#include "ProfileModule/ProfileModule.h"

class CostAnalysis {
  public:
    virtual double 
      estimateCost(llvm::StringRef, const ProfileModule*,
          CostEstimatorOptions) const = 0;
};

class CacheAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

class StaticInstructionAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

class TTIInstructionAnalysis : public CostAnalysis {
  public:
    TTIInstructionAnalysis();

    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};


class BranchAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

class CallAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*,
          CostEstimatorOptions) const;
};

namespace {
  std::unique_ptr<CostAnalysis> 
    createCostAnalysis(CostAnalysisKind Kind) {
      switch (Kind) {
        case Cache:
          return std::unique_ptr<CostAnalysis>(new CacheAnalysis());
        default:
        case StaticInstruction:
          return std::unique_ptr<CostAnalysis>(new StaticInstructionAnalysis());
        case TTIInstruction:
          return std::unique_ptr<CostAnalysis>(new TTIInstructionAnalysis());
        case Branch:
          return std::unique_ptr<CostAnalysis>(new BranchAnalysis());
        case Call:
          return std::unique_ptr<CostAnalysis>(new CallAnalysis());
      }
    } 
}
