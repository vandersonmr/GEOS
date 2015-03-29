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

double StaticInstructionAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();
  auto Func = M->getFunction(FuncName);

  for (auto &BB : *Func) {
    double BBCost = 0; 

    for (auto &I : BB)
      BBCost += 1;//InstructionCostEstimator::getInstructionCost(I); 

    Cost += Profile->getBasicBlockFrequency(BB) * BBCost;
  }
  
  return Cost;   
} 
