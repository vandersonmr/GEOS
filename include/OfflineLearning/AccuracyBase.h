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
#ifndef ACCURACYBASE_H
#define ACCURACYBASE_H

#include <vector>
#include <unordered_map>
#include <string>
#include <sstream>
#include <fstream>

#define AccuracyBase std::unordered_map<std::string, std::vector<double>>

AccuracyBase loadAccuracyBase(StringRef Str) {
  AccuracyBase Base;
  std::ifstream Infile(Str.str().c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    std::istringstream Iss(Line);

    std::string Name;
    Iss >> Name;

    for (int I = CostAnalysisKind::RegisterUse; 
        I != CostAnalysisKind::RandomCost; I++) {
      double C;
      Iss >> C;
      Base[Name].push_back(C);
    }
  }

  return Base;
}

double getAccuracyFor(std::string& ClosestBench, CostAnalysisKind OptKind, 
    AccuracyBase& Base) {
  return Base[ClosestBench][static_cast<int>(OptKind)];
}

#endif
