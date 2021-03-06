//===-- TTIInstructionAnalysis.cpp - Arch Instruction Estimator -*- C++ -*-===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of an
/// instruction cost anaysis that is sensitive to the architecture.
///
//===----------------------------------------------------------------------===//

#include "geos/CostEstimator/CostAnalysis.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/TargetSelect.h"

#include "./CostModel.cpp"

using namespace llvm;

CostModelAnalysis *InstructionCostModel = nullptr; 
legacy::FunctionPassManager *FPM = nullptr;

TTIInstructionAnalysis::TTIInstructionAnalysis() {
  PassRegistry &Registry = *PassRegistry::getPassRegistry();
  initializeAnalysis(Registry);

  InstructionCostModel =
    static_cast<CostModelAnalysis*>(createCostModelAnalysisPass());
}

TTIInstructionAnalysis::~TTIInstructionAnalysis() {
  delete FPM;
  FPM = nullptr;
}

double TTIInstructionAnalysis::estimateCost(Function &Func, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();

  if (FPM == nullptr) { 
    FPM = new legacy::FunctionPassManager(M);
    FPM->add(InstructionCostModel);
    FPM->doInitialization(); 
  }

  FPM->run(Func);

  for (auto &BB : Func) {
    double BBCost = 0; 

    for (auto &I : BB) {
      unsigned InstCost = InstructionCostModel->getInstructionCost(&I);

      if (InstCost != (unsigned) - 1)
        BBCost += InstCost;
      else
        BBCost += 1; 
    }

    Cost += Profile->getBasicBlockFrequency(BB) * BBCost;
  }

  return (Cost * 0.9 * 0.25) / Opts.CPUClockInGHz;
}
