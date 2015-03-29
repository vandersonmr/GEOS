//===-- include/CostEstimator.h - llvm::Instruction Cost Estimator -*- C++ -*---===//
//
// The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of
/// a LLVM llvm::Instruction Cost Estimator. From an LLVM instruction it gives a cost
/// based in its execution time.
///
//===----------------------------------------------------------------------===//

#include "llvm/IR/Instructions.h"

enum Cost {
  High = 4,
  Medium = 1,
  Low = 1,
  None = 0
};

class InstructionCostEstimator {
  public:
    static unsigned getInstructionCost(const llvm::Instruction &I);
};
