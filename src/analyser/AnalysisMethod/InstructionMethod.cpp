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
estimateExecutionTime(llvm::Function* Func, const ProfileModule &Freq) const { 
  double PerformanceMensurment = 0;

  printf("%s \n", Func->getName().str().c_str());
  for (auto &BB : *Func) {
    printf("\t%s : %ld \n", BB.getName().str().c_str(), 
        Freq.getBasicBlockFrequency(&BB));
    PerformanceMensurment += 
      Freq.getBasicBlockFrequency(&BB) * BB.getInstList().size() * 0.8;
  } 

  return PerformanceMensurment;
} 
