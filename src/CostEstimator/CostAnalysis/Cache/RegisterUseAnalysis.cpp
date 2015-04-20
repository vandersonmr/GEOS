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

#include "llvm/CodeGen/MachineFunctionAnalysis.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachinePostDominators.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetSubtargetInfo.h"

#include <unordered_map>

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

MachineRegisterUse *MAST1 = nullptr;
void compileModule1(Module *M, const ProfileModule *Profile, PassManager &PM) {
  Triple TheTriple;

  std::string TargetTriple;
  StringRef MCPU = sys::getHostCPUName();

  M->setTargetTriple(Triple::normalize(TargetTriple));
  TheTriple = Triple(M->getTargetTriple());

  if (TheTriple.getTriple().empty())
    TheTriple.setTriple(sys::getDefaultTargetTriple());

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", TheTriple, Error);

  if (!TheTarget) {
    errs() << ": " << Error;
    return;
  }

  std::string FeaturesStr;
  CodeGenOpt::Level OLvl = CodeGenOpt::None;

  TargetOptions Options;

  //std::unique_ptr<TargetMachine> Target(
  TargetMachine* Target = TheTarget->createTargetMachine(TheTriple.getTriple(), MCPU, FeaturesStr,
      Options, Reloc::Model::Default, 
      CodeModel::Model::Default,
      OLvl);
  assert(Target && "Could not allocate target machine!");

  TargetLibraryInfo *TLI = new TargetLibraryInfo(TheTriple);
  PM.add(TLI);

  if (const DataLayout *DL = Target->getSubtargetImpl()->getDataLayout())
    M->setDataLayout(DL);
  PM.add(new DataLayoutPass());

  std::error_code Err;
  raw_fd_ostream *Out =          
    new raw_fd_ostream("/dev/null", Err, llvm::sys::fs::OpenFlags::F_None);
  formatted_raw_ostream FOS(*Out);

  Target->addPassesToEmitFile(PM, FOS, 
      TargetMachine::CodeGenFileType::CGFT_Null, false, 
      nullptr, nullptr);

  MAST1 = new MachineRegisterUse(Profile, *Target);  

  PM.add(MAST1);
  PM.run(*M);
  MAST1->getFunctionCost(*(M->getFunction("main")));
}

PassManager PM1;
RegisterUseAnalysis::RegisterUseAnalysis(const ProfileModule* P) {
  PModule = P;
  Module *M = P->getLLVMModule();
  compileModule1(M, P, PM1);
}

double RegisterUseAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule *Profile, CostEstimatorOptions Opts) const {

  Module *M = PModule->getLLVMModule();
  return MAST1->getFunctionCost(*(M->getFunction(FuncName))) * 0.25;
}
