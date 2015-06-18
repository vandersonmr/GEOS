//===---- include/PassSequence.h - The Pass Sequence Manager  -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition and implementation of a class with
/// information and metrics of a ProfileModule, which can be used for comparing
/// two ProfileModules with the distance function; 
///
//===----------------------------------------------------------------------===//
#ifndef OPTACCURACYBASE_H
#define OPTACCURACYBASE_H

#include "ProfileModule/PassSequence.h"

#include <vector>
#include <unordered_map>
#include <string>
#include <sstream>
#include <fstream>

#define OptAccuracyBaseT std::unordered_map<int, std::vector<double>>

OptAccuracyBaseT loadOptAccuracyBase(StringRef Str) {
  OptAccuracyBaseT Base;
  std::ifstream Infile(Str.str().c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    std::string Optimization;
    std::istringstream Iss(Line);
    Iss >> Optimization;

    std::vector<double> Corrections;
    for (int I = CostAnalysisKind::RegisterUse; 
        I != CostAnalysisKind::RandomCost; I++) {
      double C;
      Iss >> C;
      Corrections.push_back(C);
    }

    PassSequence P;
    P.loadString(Optimization);

    Base[P[0]] = Corrections;
  }

  return Base;
}

double getPassSequenceAccuracy(PassSequence& P, CostEstimatorOptions Opts,
    OptAccuracyBaseT& Base) {

  double OCor = 0;
  for (auto O : P) {
    double Aux = 0;
    for (auto OptKind : Opts.AnalysisActivated) {
      if (Base.count(static_cast<int>(O)))
        Aux += Base[static_cast<int>(O)][static_cast<int>(OptKind)];
    }
    OCor += (Aux/Opts.AnalysisActivated.size());
  }

  return 2-(OCor/P.size());
}

#endif
