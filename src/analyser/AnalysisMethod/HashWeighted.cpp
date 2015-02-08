//= analyser/AnalysisMethod/HashWeighted.cpp - BB Cost Estimative -*- C++ -*-=//
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
/// Furthermore, for each basic block will be done a search for an equivalent in 
/// the database and this search is done using weights for diferents parts of 
/// the hash. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"

using namespace llvm;

HashWeightedMethod::HashWeightedMethod(StringRef Filename) {
  DBManager = new DatabaseManager(Filename);
}

double HashWeightedMethod::
estimateExecutionTime(llvm::Function* Func, const ProfileModule &Freq) const { 
  double PerformanceMensurment = 0;

  for (auto &BB : *Func) {
    BBHash Hash(BB);
    PerformanceMensurment += Freq.getBasicBlockFrequency(&BB) * 
                   DBManager->getTime(*DBManager->getNearest(Hash));
  } 

  return PerformanceMensurment;
} 
