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

#include "llvm/IR/Module.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetSelect.h"

#include "CostEstimator/CostAnalysis.h"
#include "./CostModel.cpp"

using namespace llvm;

CostModelAnalysis *InstructionCostModel; 
TTIInstructionAnalysis::TTIInstructionAnalysis() {
    InstructionCostModel =
      static_cast<CostModelAnalysis*>(createCostModelAnalysisPass());
}

double TTIInstructionAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule* Profile, CostEstimatorOptions Opts) const {

  double Cost = 0;

  auto M = Profile->getLLVMModule();
  auto Func = M->getFunction(FuncName);

  FunctionPassManager FPM(M); 

  FPM.add(InstructionCostModel);
  FPM.doInitialization(); 
  FPM.run(*Func);

  for (auto &BB : *Func) {
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
  
  return Cost;   
}
