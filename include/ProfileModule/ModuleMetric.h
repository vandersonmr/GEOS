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
#ifndef MODULEMETRIC_H
#define MODULEMETRIC_H

#include <cmath>
#include <sstream>
#include <algorithm>

class ModuleMetric {
  private:
    uint32_t Threshold = 30; // Should be between 0% and 100%
    uint64_t NumInstruction = 0;
    uint64_t NumIntInstruction = 0;
    uint64_t NumFloatInstruction = 0;
    uint64_t NumExecIntInstruction = 0;
    uint64_t NumExecFloatInstruction = 0;
    uint64_t NumFunctions = 0;
    uint64_t NumBasicBlocks = 0;
    uint64_t NumBranches = 0;
    uint64_t MeanFunctionExecFreq = 0;
    uint64_t MeanBasicBlockExecFreq = 0;
    uint64_t MeanBranchExecFreq = 0;
    bool Recursion = false;

    double diff(uint64_t A, uint64_t B) {
      if (B == 0) B = 1;
      if (A == 0) A = 1;
      double R = 0;
      if (A > B) R = A/B;
      else R = B/A;

      if (R > 100) return 100;
      else return R;
    }

  public:
    ModuleMetric(uint64_t N, uint64_t NI, uint64_t NF, uint64_t NEI, 
        uint64_t NEF, uint64_t F, uint64_t B, uint64_t L, uint64_t MF, 
        uint64_t MB, uint64_t ML, bool R, uint32_t T = 30) {

      NumInstruction = N;
      NumIntInstruction = NI;
      NumFloatInstruction = NF;
      NumExecIntInstruction = NEI;
      NumExecFloatInstruction = NEF;
      NumFunctions = F;
      NumBasicBlocks = B;
      NumBranches = L;
      MeanFunctionExecFreq = MF;
      MeanBasicBlockExecFreq = MB;
      MeanBranchExecFreq = ML;
      Recursion = R;
      Threshold = T; 
    }

    uint64_t getNumInstruction() const {
      return NumInstruction;
    }

    uint64_t getNumIntInstruction() const {
      return NumIntInstruction;
    }

    uint64_t getNumFloatInstruction() const {
      return NumFloatInstruction;
    }

    uint64_t getNumExecIntInstruction() const {
      return NumExecIntInstruction;
    }

    uint64_t getNumExecFloatInstruction() const {
      return NumExecIntInstruction;
    }

    uint64_t getNumFunctions() const {
      return NumFunctions;
    }

    uint64_t getNumBasicBlocks() const {
      return NumBasicBlocks;
    }

    uint64_t getNumBranches() const {
      return NumBranches;
    }

    uint64_t getMeanFunctionsExecFreq() const {
      return MeanFunctionExecFreq;
    }

    uint64_t getMeanBasicBlocksExecFreq() const {
      return MeanBasicBlockExecFreq;
    }

    uint64_t getMeanBranchExecFreq() const {
      return MeanBranchExecFreq;
    }

    bool hasRecursion() const {
      return Recursion;
    }

    uint32_t distance(const ModuleMetric& M) {
      double D = 0;
      if (hasRecursion() != M.hasRecursion())
        D += 1000;

      D += diff(getNumInstruction(), M.getNumInstruction());
      D += diff(getNumIntInstruction(), M.getNumIntInstruction());
      D += 2 * diff(getNumFloatInstruction(), M.getNumFloatInstruction());

      D += 5*diff(getNumExecIntInstruction(), M.getNumExecIntInstruction());
      D += 10*diff(getNumExecFloatInstruction(), M.getNumExecFloatInstruction()); 
      D += 20*diff(getNumExecIntInstruction()/getNumExecFloatInstruction(), 
          M.getNumExecIntInstruction()/M.getNumExecFloatInstruction()); 

      D += diff(getNumFunctions(), M.getNumFunctions())/2; 
      D += diff(getNumBasicBlocks(), M.getNumBasicBlocks())/2; 
      D += diff(getNumBranches(), M.getNumBranches())/2;

      D += diff(getMeanFunctionsExecFreq(), M.getMeanFunctionsExecFreq())/10;
      D += diff(getMeanBasicBlocksExecFreq(), M.getMeanBasicBlocksExecFreq())/10;
      D += diff(getMeanBranchExecFreq(), M.getMeanBranchExecFreq())/10; 

      return static_cast<uint32_t>(D);
    }

    std::string getString() {
      std::stringstream sstm;
      sstm << NumInstruction << " " << NumIntInstruction << " " << 
        NumFloatInstruction << " " << NumExecIntInstruction << " " << 
        NumExecFloatInstruction << " " << NumFunctions << " " << NumBasicBlocks
        << " " << NumBranches << " " << MeanFunctionExecFreq << " " << 
        MeanBasicBlockExecFreq << " " << MeanBranchExecFreq << " " << Recursion  
        << std::endl;
      return sstm.str();
    }
};

#endif
