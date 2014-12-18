//== analyser/AnalysisMethod/HashMethod.cpp - BB Cost Estimative -*- C++ -*-==//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of an basic block cost 
/// analysis. It uses the execution frequency multiplied by a weight given 
/// by a database. This database is create by the execution of other programs 
/// and contains hashs and executions time for each basic block of this ones.
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"

using namespace llvm;

HashMethod::HashMethod(StringRef Filename) {
  DBManager = new DatabaseManager(Filename);
}

double HashMethod::
estimateExecutionTime(Function *Func, 
    std::unique_ptr<GCOVFunction, 
    std::default_delete<GCOVFunction> > &Freq) {
  
  double PerformanceMensurment = 0;
  auto MBB = Freq->block_begin(); 
  for (auto &BB : *Func) {
    BBHash Hash(BB);
    PerformanceMensurment += (*MBB)->getCount() * 
                   DBManager->getTime(*DBManager->getNearest(Hash, false));
    ++MBB;
  } 

  return PerformanceMensurment;
} 
