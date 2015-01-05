//  analyser/AnalysisMethod/RandomMethod.cpp - BB Cost Estimative -*- C++ -*- //
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It uses the execution frequency multiplied by a random number. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"
#include <time.h> 
#include <stdlib.h>

using namespace llvm;

double RandomMethod::
estimateExecutionTime(llvm::Function* Func, llvm::GCOVFunction* Freq) { 
  double PerformanceMensurment = 0;
  auto MBB = Freq->block_begin(); 
  for (size_t i = 0; i < Func->size(); ++i) {
    PerformanceMensurment += (*MBB)->getCount() * rand() % 10 + 1;
    ++MBB;
  } 

  return PerformanceMensurment;
} 
