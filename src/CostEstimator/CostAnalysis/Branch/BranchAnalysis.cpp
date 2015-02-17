//===-- include/CostEstimator.h - llvm::Instruction Cost Estimator -*- C++ -*---===//
//
// The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of
/// a LLVM llvm::Instruction Cost Estimator. From an LLVM instruction it gives a cost
/// based in its execution time.
///
//===----------------------------------------------------------------------===//

#include "llvm/IR/Module.h"

#include "CostEstimator/CostAnalysis.h"
#include "CostEstimator/InstructionCostEstimator.h"

using namespace llvm;

double BranchAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();
  auto Func = M->getFunction(FuncName);

  double BranchMispredictionWeight = Opts.BranchMispredictionFrequency *
    Opts.BranchMispredictionCost;

  for (auto &BB : *Func) {
    auto Terminator = BB.getTerminator();              
    if (isa<IndirectBrInst>(Terminator)) { 
      Cost += (Profile->getBasicBlockFrequency(BB) * 
          BranchMispredictionWeight);
    } else if (isa<BranchInst>(Terminator)) {
      if (((BranchInst*) Terminator)->isConditional())
        Cost += (Profile->getBasicBlockFrequency(BB) * 
            BranchMispredictionWeight);
    }  
  }
  
  return Cost;   
}
