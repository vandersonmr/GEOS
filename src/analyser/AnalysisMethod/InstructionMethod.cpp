//analyser/AnalysisMethod/InstructionMethod.cpp - BB Cost Estimative -*- C++ -*-
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It uses the execution frequency multiplied by the number of 
/// instruction in the basic block. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"

using namespace llvm;

double InstructionMethod::
estimateExecutionTime(llvm::Function* Func, llvm::GCOVFunction* Freq) { 
  double PerformanceMensurment = 0;
  auto MBB = Freq->block_begin(); 
  for (auto &BB : *Func) {
    PerformanceMensurment += (*MBB)->getCount() * BB.getInstList().size();
    ++MBB;
  } 

  return PerformanceMensurment;
} 
