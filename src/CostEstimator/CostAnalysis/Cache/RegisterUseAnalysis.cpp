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

#include "geos/CostEstimator/CostAnalysis.h"

#include "geos/CostEstimator/CodeGenModule.h"
#include "geos/CostEstimator/InstructionCostEstimator.h"

using namespace llvm;

struct MachineRegisterUse : public FunctionPass {
  static char ID;

  const ProfileModule *Profile;
  const TargetMachine &TM;
  MachineRegisterUse(const ProfileModule *P, const TargetMachine &tm) : 
    FunctionPass(ID), Profile(P), TM(tm) {
  };

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
    AU.addRequired<MachineFunctionAnalysis>();
  }

  bool First = true;
  double getFunctionCost(Function &F) {
    return MFCost[F.getName().str()];
  }

  virtual bool runOnFunction(Function &F) {
    MachineFunction *MF = &getAnalysis<MachineFunctionAnalysis>().getMF();
    StringRef FunName(F.getName());

    MFCost[FunName.str()] = 0.0;
    for (auto &MB : *MF) {
      int MBCost = 0;
      for (auto &MI : MB) 
        if (MI.mayLoadOrStore())
          MBCost += 1;

      MFCost[FunName.str()] += 
        Profile->getBasicBlockFrequency(*(MB.getBasicBlock())) * MBCost * 1.3;

    }

    return false;
  }

  private:
  unsigned NextFnNum = 0;
  std::unordered_map<std::string, double> MFCost;

  void calculateRegisterCost(StringRef); 
};

char MachineRegisterUse::ID = 0;

MachineRegisterUse *MRU;

RegisterUseAnalysis::RegisterUseAnalysis(const ProfileModule* P) {
  PM = new legacy::PassManager;
  PModule = P;
  Module *M = P->getLLVMModule();
  MRU = runCodeGenPasses<MachineRegisterUse>(M, P, *PM);
}

RegisterUseAnalysis::~RegisterUseAnalysis() {
  delete PM;
}

double RegisterUseAnalysis::estimateCost(Function &Func, 
    const ProfileModule *Profile, CostEstimatorOptions Opts) const {

  Module   *M = PModule->getLLVMModule();
  return MRU->getFunctionCost(Func) * 0.25;
}
