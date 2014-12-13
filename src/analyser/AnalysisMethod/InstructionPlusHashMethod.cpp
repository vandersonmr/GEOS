//  analyser/AnalysisMethod/InstructionPlusHashMethod.cpp - BB Cost Estimative 
//  -*- C++ -*-
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
/// instruction in the basic block plus the HashMethod weight. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"

using namespace llvm;

InstructionPlusHashMethod::InstructionPlusHashMethod(StringRef Filename) {
  IM = new InstructionMethod();
  HM = new HashMethod(Filename);
}

double InstructionPlusHashMethod::
estimateExecutionTime(Function *Func, 
    std::unique_ptr<GCOVFunction, 
    std::default_delete<GCOVFunction> > &Freq) {

  return IM->estimateExecutionTime(Func, Freq) 
    + HM->estimateExecutionTime(Func, Freq);
} 
