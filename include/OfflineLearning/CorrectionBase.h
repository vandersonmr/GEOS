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
#ifndef CORRECTIONBASE_H
#define CORRECTIONBASE_H

#include "ProfileModule/PassSequence.h"

#include <vector>
#include <string>
#include <sstream>
#include <fstream>

#define CorrectionBaseT std::vector<std::pair<PassSequence, std::vector<double>>>

CorrectionBaseT loadCorrectionBase(StringRef Str) {
  CorrectionBaseT Base;
  std::ifstream Infile(Str.str().c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    std::string Sequence;
    std::istringstream Iss(Line);
    std::getline(Iss, Sequence, ']');

    char Aux;
    Iss >> Aux;
    
    std::vector<double> Corrections;
    for (int I = CostAnalysisKind::RegisterUse; 
        I != CostAnalysisKind::RandomCost; I++) {
      double C;
      Iss >> C;
      Corrections.push_back(C);
    }

    PassSequence Passes;
    Passes.loadString(Sequence);

    Base.push_back(
        std::pair<PassSequence, std::vector<double>>(Passes, Corrections));
  }

  return Base;
}

double getCorrectionFor(PassSequence& P, CostEstimatorOptions Opts,
    CorrectionBaseT& Base) {

  double Correction = 1;
  unsigned NearestDistance = 10000;
  for (auto &I : Base) {
    auto D = I.first.distance(P);
    if (D < NearestDistance) {
      NearestDistance = D;
      Correction = 0;
      for (auto OptKind : Opts.AnalysisActivated) 
        Correction += I.second[OptKind];
      Correction /= Opts.AnalysisActivated.size();
    }
  }

  return Correction;
}

#endif
