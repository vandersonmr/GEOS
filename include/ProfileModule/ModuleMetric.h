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

class ModuleMetric {
  private:
    uint32_t Threshold = 10; // Should be between 0% and 100%
    uint64_t NumInstruction = 0;
    uint64_t NumIntInstruction = 0;
    uint64_t NumFloatInstruction = 0;
    uint64_t NumExecIntInstruction = 0;
    uint64_t NumExecFloatInstruction = 0;
    uint64_t NumFunctions = 0;
    uint64_t NumBasicBlocks = 0;
    uint64_t NumLoops = 0;
    uint64_t MeanFunctionExecFreq = 0;
    uint64_t MeanBasicBlockExecFreq = 0;
    uint64_t MeanLoopExecFreq = 0;
    bool Recursion = false;

    bool isClose(uint64_t A, uint64_t B) {
      return std::abs((float) (A/B) - 1 >= (float) Threshold/100);
    }

  public:
    ModuleMetric(uint64_t N, uint64_t NI, uint64_t NF, uint64_t NEI, 
        uint64_t NEF, uint64_t F, uint64_t B, uint64_t L, uint64_t MF, 
        uint64_t MB, uint64_t ML, bool R, uint32_t T = 10) {

      NumInstruction = N;
      NumIntInstruction = NI;
      NumFloatInstruction = NF;
      NumExecIntInstruction = NEI;
      NumExecFloatInstruction = NEF;
      NumFunctions = F;
      NumBasicBlocks = B;
      NumLoops = L;
      MeanFunctionExecFreq = MF;
      MeanBasicBlockExecFreq = MB;
      MeanLoopExecFreq = ML;
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

    uint64_t getNumLoops() const {
      return NumLoops;
    }

    uint64_t getMeanFunctionsExecFreq() const {
      return MeanFunctionExecFreq;
    }

    uint64_t getMeanBasicBlocksExecFreq() const {
      return MeanBasicBlockExecFreq;
    }

    uint64_t getMeanLoopExecFreq() const {
      return MeanLoopExecFreq;
    }

    bool hasRecursion() const {
      return Recursion;
    }

    uint32_t distance(const ModuleMetric& M) {
      uint32_t D = 0;
      if (hasRecursion() != M.hasRecursion())
        ++D;
      if (!isClose(getNumInstruction(), M.getNumInstruction())) 
        ++D;
      if (!isClose(getNumIntInstruction(), M.getNumIntInstruction())) 
        ++D;
      if (!isClose(getNumFloatInstruction(), M.getNumFloatInstruction())) 
        ++D;
      if (!isClose(getNumExecIntInstruction(), M.getNumExecIntInstruction())) 
        ++D;
      if (!isClose(getNumExecFloatInstruction(), M.getNumExecFloatInstruction())) 
        ++D;
      if (!isClose(getNumFunctions(), M.getNumFunctions())) 
        ++D;
      if (!isClose(getNumBasicBlocks(), M.getNumBasicBlocks())) 
        ++D;
      if (!isClose(getNumLoops(), M.getNumLoops())) 
        ++D;
      if (!isClose(getMeanFunctionsExecFreq(), M.getMeanFunctionsExecFreq())) 
        ++D;
      if (!isClose(getMeanBasicBlocksExecFreq(), M.getMeanBasicBlocksExecFreq())) 
        ++D;
      if (!isClose(getMeanLoopExecFreq(), M.getMeanLoopExecFreq())) 
        ++D;

      return D;
    }

    std::string getString() {
      std::stringstream sstm;
      sstm << NumInstruction << " " << NumIntInstruction << " " << 
        NumFloatInstruction << " " << NumExecIntInstruction << " " << 
        NumExecFloatInstruction << " " << NumFunctions << " " << NumBasicBlocks
        << " " << NumLoops << " " << MeanFunctionExecFreq << " " << 
        MeanBasicBlockExecFreq << " " << MeanLoopExecFreq << std::endl;
      return sstm.str();
    }
};

#endif
