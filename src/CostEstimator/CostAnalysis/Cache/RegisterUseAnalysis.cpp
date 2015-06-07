//===--------- CacheAnalysis.cpp - Cache Cost Estimator -*- C++ -*---------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of the instruction
/// cache analysis and also use of registers analysis.
///
//===----------------------------------------------------------------------===//

#include "CostEstimator/CostAnalysis.h"

#include "CostEstimator/CodeGenModule.h"
#include "CostEstimator/InstructionCostEstimator.h"

using namespace llvm;

struct MachineRegisterUse : public FunctionPass {
  static char ID;

  const ProfileModule *Profile;
  const TargetMachine &TM;
  MachineRegisterUse(const ProfileModule *P, const TargetMachine &tm) : 
    FunctionPass(ID), Profile(P), TM(tm) {
  };

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<MachineFunctionAnalysis>();
  }

  bool First = true;
  double getFunctionCost(Function &F) {
    if (FuncToMachine[F.getName().str()] != 0 && 
        !MFCost.count(F.getName().str())) {

      calculateRegisterCost(*FuncToMachine[F.getName().str()]);
    }

    return MFCost[F.getName().str()];
  }

  virtual bool runOnFunction(Function &F) {
    FuncToMachine[F.getName().str()] = 
      &getAnalysis<MachineFunctionAnalysis>().getMF();
    return false;
  }

  private:
  unsigned NextFnNum = 0;
  std::unordered_map<std::string, MachineFunction*> FuncToMachine;
  std::unordered_map<std::string, double> MFCost;

  void calculateRegisterCost(MachineFunction&); 
};

void MachineRegisterUse::calculateRegisterCost(MachineFunction &MF) {
  for (auto &MB : MF) {
    int MBCost = 0;
    for (auto &MI : MB)  
      if (MI.mayLoad() || MI.mayStore())
        MBCost += 1;
    
    MFCost[MF.getName().str()] += 
      Profile->getBasicBlockFrequency(*(MB.getBasicBlock())) * MBCost * 1.3;
  }
}

char MachineRegisterUse::ID = 0;

MachineRegisterUse *MRU;

RegisterUseAnalysis::RegisterUseAnalysis(const ProfileModule* P) {
  PM = new PassManager;
  PModule = P;
  Module *M = P->getLLVMModule();
  MRU = runCodeGenPasses<MachineRegisterUse>(M, P, *PM);
}

RegisterUseAnalysis::~RegisterUseAnalysis() {
  delete PM;
}

double RegisterUseAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule *Profile, CostEstimatorOptions Opts) const {

  Module *M = PModule->getLLVMModule();
  return MRU->getFunctionCost(*(M->getFunction(FuncName))) * 0.25;
}
