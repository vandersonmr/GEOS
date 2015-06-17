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
#ifndef CODEMETRICBASE_H
#define CODEMETRICBASE_H

#include "ProfileModule/ProfileModule.h"
#include <string>
#include <vector>
#include <sstream>
#include <fstream>

#define MetricBaseT std::vector<std::pair<std::string, ModuleMetric>>

MetricBaseT loadMetricsBase(StringRef Str) {
  MetricBaseT Base;
  std::ifstream Infile(Str.str().c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    std::string Name;
    uint64_t N  = 0;
    uint64_t NI = 0;  
    uint64_t NF = 0;  
    uint64_t NEI = 0;  
    uint64_t NEF = 0;  
    uint64_t Fu = 0;  
    uint64_t B = 0;  
    uint64_t L = 0;  
    uint64_t MF = 0;  
    uint64_t MB = 0;  
    uint32_t ML = 0;  
    bool R = false;  

    std::istringstream Iss(Line);
    Iss >> Name >> N >> NI >> NF >> NEI >> NEF >> Fu >> B >> L >> MF >> MB >> 
      ML >> R;

    ModuleMetric MM(N, NI, NF, NEI, NEF, Fu, B, L, MF, MB, ML, R);

    Base.push_back(std::make_pair(Name, MM));
  }
  return Base;
}

std::string getNearestMetric(std::shared_ptr<ProfileModule> PModule, 
    MetricBaseT& Base) {
  uint32_t BestDistance = 99;
  std::string BestName; 
  for (auto &I : Base) {
    auto D = PModule->getMetrics().distance(I.second); 
    if (D < BestDistance) {
      BestDistance = D;
      BestName = I.first;
    }
  }
  return BestName;
}

#endif

