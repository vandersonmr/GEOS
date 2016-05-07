//===----------- RandomCost.cpp - Random Cost Generator -*- C++ -*---------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief Estimate a random cost.
///
//===----------------------------------------------------------------------===//

#include "geos/CostEstimator/CostAnalysis.h"

using namespace llvm;

double RandomAnalysis::estimateCost(Function &Func, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();

  std::random_device Rd;
  std::default_random_engine E1(Rd());
  std::uniform_int_distribution<int> uniform_dist(1, 4);

  for (auto &BB : Func) 
    Cost += uniform_dist(E1) * Profile->getBasicBlockFrequency(BB);
  
  return Cost / Opts.CPUClockInGHz;
}
