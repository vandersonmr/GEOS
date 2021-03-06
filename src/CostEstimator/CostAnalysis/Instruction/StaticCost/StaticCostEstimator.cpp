//===-- StaticCostEstimator.cpp - Static Instruction Estimator -*- C++ -*--===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of an
/// instruction cost anaysis that is NOT sensitive to the architecture. 
///
//===----------------------------------------------------------------------===//

#include "geos/CostEstimator/CostAnalysis.h"

#include "geos/CostEstimator/InstructionCostEstimator.h"

using namespace llvm;

double StaticInstructionAnalysis::estimateCost(Function &Func, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();

  for (auto &BB : Func) {
    double BBCost = 0; 

    for (auto &I : BB)
      BBCost += InstructionCostEstimator::getInstructionCost(I); 

    Cost += Profile->getBasicBlockFrequency(BB) * BBCost;
  }
  
  return Cost / Opts.CPUClockInGHz;
} 
