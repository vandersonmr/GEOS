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
estimateExecutionTime(Function *Func, 
    std::unique_ptr<GCOVFunction, 
    std::default_delete<GCOVFunction> > &Freq) {

  double PerformanceMensurment = 0;
  auto MBB = Freq->block_begin(); 
  for (size_t i = 0; i < Func->size(); ++i) {
    PerformanceMensurment += (*MBB)->getCount();
    ++MBB;
  } 

  return PerformanceMensurment;
} 
