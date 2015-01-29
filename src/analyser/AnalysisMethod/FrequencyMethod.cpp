// analyser/AnalysisMethod/FrequencyMethod.cpp - BB Cost Estimative -*- C++ -*-
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It uses the frequency of execution of the basic block to give its 
/// execution cost.
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"

using namespace llvm;

double FrequencyMethod::
estimateExecutionTime(llvm::Function* Func, const ProfileModule &Freq) const { 
  double PerformanceMensurment = 0;

  for(auto &BB : *Func) 
    PerformanceMensurment = Freq.getBasicBlockFrequency(&BB);

  return PerformanceMensurment;
} 
