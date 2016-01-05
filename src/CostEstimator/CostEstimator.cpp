//===--------- CostEstimator.cpp - BB Cost Estimative -*- C++ -*- ---------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of the program cost 
/// analyser. It uses the the AnalysisMethods to calculate the cost of each
/// function or the entire module. 
///
//===----------------------------------------------------------------------===//

#include "geos/CostEstimator/CostEstimator.h"

#include "geos/CostEstimator/CostAnalysis.h"

using namespace llvm;

double 
CostEstimator::getModuleCost(const ProfileModule *Profile,
    CostEstimatorOptions Opts) {
  
  double CostEstimated = 0;

  for (auto AnalysisKind : Opts.AnalysisActivated) {
    std::unique_ptr<CostAnalysis> Analyse = 
      createCostAnalysis(AnalysisKind, Profile);
    
    for (auto &Func : *Profile->getLLVMModule())
      CostEstimated += Analyse->estimateCost(Func.getName(), Profile, Opts);
  }

  return CostEstimated / (Opts.CPUClockInGHz * std::pow(10, 9));
}

double 
CostEstimator::getFunctionCost(StringRef FuncName, const ProfileModule *Profile,
    CostEstimatorOptions Opts) {
  
  double CostEstimated = 0;

  for (auto AnalysisKind : Opts.AnalysisActivated) {
    std::unique_ptr<CostAnalysis> Analyse = 
      createCostAnalysis(AnalysisKind, Profile);

    CostEstimated += Analyse->estimateCost(FuncName, Profile, Opts);
  }

  return CostEstimated / (Opts.CPUClockInGHz * std::pow(10, 9));
}
  
