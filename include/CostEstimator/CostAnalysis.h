//===---- include/CostAnalysis.h - Basic Block Cost Estimator -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis of the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//
#ifndef COSTANALYSIS_H
#define COSTANALYSIS_H

#include "CostEstimator/CostEstimatorOptions.h"
#include "ProfileModule/ProfileModule.h"

#include "llvm/PassManager.h"

class CostAnalysis {
  public:
    /// \brief This is a interface for implementation of a function for
    /// analysis the cost a function. 
    //
    /// \param The parameters are the name of the function, the ProfileModule, 
    /// and the options.
    virtual double 
      estimateCost(llvm::StringRef, const ProfileModule*,
          CostEstimatorOptions) const = 0;
    virtual ~CostAnalysis() {}
};

/// This analyis method estimate the cost of the use of registers. Due to the 
/// fact that it is necessery to compile the LLVM code to the machine assembly, 
/// it can be expensive.
class RegisterUseAnalysis : public CostAnalysis {
  private: 
    const ProfileModule *PModule;
    llvm::PassManager *PM;
  public:
    RegisterUseAnalysis(const ProfileModule*);
    ~RegisterUseAnalysis();
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

/// This analyis method estimate the cost of the instruction's cache. Due to the
/// fact that it is necessery to compile the LLVM code to the machine assembly, 
/// so it can be expensive.
class InstructionCacheAnalysis : public CostAnalysis {
  private: 
    const ProfileModule *PModule;
    llvm::PassManager *PM;
  public:
    InstructionCacheAnalysis(const ProfileModule*);
    ~InstructionCacheAnalysis();
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

/// \brief Return the sum of the cost of all LLVM instruction multiplicated by 
/// its the execution frequency. The cost is the same for every architecture.
class StaticInstructionAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

/// \brief The same as StaticInstruction except that the cost for each LLVM
/// instruction can change based on the architecture.
class TTIInstructionAnalysis : public CostAnalysis {
  public:
    TTIInstructionAnalysis();
    ~TTIInstructionAnalysis();
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

/// \brief Count the amount of unconditional branchs in the code and their 
/// execution frequencies.
class BranchAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*, 
          CostEstimatorOptions) const;
};

/// \brief This function multiply the execution frequency of each call for 
/// external function by their costs given and generated previously.
class CallAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*,
          CostEstimatorOptions) const;
};

/// \brief Randomize a cost between 1 and 4 for each basic block.
class RandomAnalysis : public CostAnalysis {
  public:
    double 
      estimateCost(llvm::StringRef, const ProfileModule*,
          CostEstimatorOptions) const;
};

namespace {
  /// \brief Given a kind of analysis and a PModule it returns a instance of
  /// this analysis.
  std::unique_ptr<CostAnalysis> 
    createCostAnalysis(CostAnalysisKind Kind, const ProfileModule *PModule) {
      switch (Kind) {
        case RandomCost:
          return std::unique_ptr<CostAnalysis>(new RandomAnalysis());
        case InstructionCache:
          return std::unique_ptr<CostAnalysis>(
              new InstructionCacheAnalysis(PModule));
        case RegisterUse:
          return std::unique_ptr<CostAnalysis>(
              new RegisterUseAnalysis(PModule));
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
#endif
