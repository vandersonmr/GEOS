//===-------- CallCostAnalysis.cpp - Call Cost Estimator -*- C++ -*--------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of Call Cost 
/// analysis.
///
//===----------------------------------------------------------------------===//


#include "llvm/IR/Module.h"

#include "geos/CostEstimator/CostAnalysis.h"
#include "geos/CostEstimator/InstructionCostEstimator.h"

using namespace llvm;

double CallAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();
  auto Func = M->getFunction(FuncName);

  for (auto &BB : *Func) {
    double BBCost = 0; 
    for (auto &I : BB) {
      if (isa<CallInst>(I)) { 
        if (cast<CallInst>(I).getCalledFunction() == nullptr ||
            cast<CallInst>(I).getCalledFunction()->size() == 0) {
          BBCost += Profile->getCallCost(cast<CallInst>(I)); 
        }
      }
    }
    Cost += Profile->getBasicBlockFrequency(BB) * BBCost;
  }

  return Cost * 0.05;   
}
