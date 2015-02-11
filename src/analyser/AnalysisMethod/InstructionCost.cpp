// analyser/AnalysisMethod/InstructionCost.cpp - BB Cost Estimative -*- C++ -*-
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It uses the execution frequency multiplied by the sum of the
/// weight of each instruction in the basic block. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"
#include "CostEstimator.h"

using namespace llvm;

double InstructionCostMethod::
estimateExecutionTime(llvm::Function* Func, const ProfileModule &Freq) const { 
  double PerformanceMensurment = 0;

  for (auto &BB : *Func) {
    auto BBCost = 0;
    for (auto &I : BB) 
      BBCost += CostEstimator::getInstructionCost(&I);
    PerformanceMensurment += (Freq.getBasicBlockFrequency(&BB) * BBCost)/0.7851706;
  } 

  return PerformanceMensurment;
} 
