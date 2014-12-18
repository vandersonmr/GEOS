//== analyser/AnalysisMethod/ProfMethod.cpp - BB Cost Estimative -*- C++ -*-==//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It use information from program's profiling. Because of that the 
/// programa must be executed before this analysis.
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"
#include "CostEstimator.h"

#include <stdio.h>

using namespace llvm;

ProfMethod::ProfMethod(StringRef Filename) {
  ErrorOr<std::unique_ptr<MemoryBuffer>> FileBuffer =
      MemoryBuffer::getFileOrSTDIN(Filename);

  std::pair<StringRef, StringRef> LineAndTail =
      (*FileBuffer)->getBuffer().split('\n');
  
  while (!LineAndTail.first.empty()) {
    int    Id;
    double Time;

    sscanf(LineAndTail.first.str().c_str(), "%d: %lf", &Id, &Time); 
    Times[Id] = Time;

    LineAndTail = LineAndTail.second.split('\n'); 
  }
}

double ProfMethod::
estimateExecutionTime(Function *Func, 
    std::unique_ptr<GCOVFunction, 
    std::default_delete<GCOVFunction> > &Freq) {

  double PerformanceMensurment = 0;
  auto MBB = Freq->block_begin(); 
  int i = 0;
  for (auto &BB : *Func) {
    auto BBCost = 0;
    for (auto &I : BB) {
      BBCost += CostEstimator::getInstructionCost(&I);
    }

    if (BB.getInstList().size() <= 3) { 
      PerformanceMensurment +=  (((*MBB)->getCount()+1) * 100); //BBCost);// BB.getInstList().size());
      /*  cout << "a: " << (sqrt((*MBB)->getCount()/4) * BBCost) << endl;*/
    } else {
      PerformanceMensurment += ((*MBB)->getCount()+1) * pow(Times[i],2);//BB.getInstList().size());//* pow(Times[i], 2));
      /*      cout << "b: " <<  (sqrt((*MBB)->getCount()/4) * pow(Times[i],2)/100) << endl;*/
    }
    i++;
    ++MBB;
  } 

  return PerformanceMensurment;
} 
