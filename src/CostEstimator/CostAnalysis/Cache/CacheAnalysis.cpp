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

#include "CostEstimator/CostAnalysis.h"
#include "CostEstimator/InstructionCostEstimator.h"

#include "llvm/Pass.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/PassManager.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Target/TargetSubtargetInfo.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineFunction.h"

#include <iostream>
#include <unordered_map>

using namespace llvm;

struct MachineAST : public MachineFunctionPass {
  static char ID;
  const ProfileModule *Profile;
  StringRef FuncName;
  MachineAST(StringRef FName, const ProfileModule *P) : MachineFunctionPass(ID),
  Profile(P), FuncName(FName) {};

  double Cost = 0;
  virtual bool runOnMachineFunction(MachineFunction &MF) {
    if (MF.getName() == FuncName) {
      for (auto &MB : MF) {
        int MBCost = 0;
        for (auto &MI : MB) {
          if (MI.mayLoad() || MI.mayStore()) 
            MBCost += 1;
        }
        Cost += Profile->getBasicBlockFrequency(*(MB.getBasicBlock())) * MBCost;
      }
    }
    return true;
  }
};

char MachineAST::ID = 0;

void compileModule(Module *M, MachineAST* MAST, PassManager &PM) {
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

  std::unique_ptr<TargetMachine> Target(
      TheTarget->createTargetMachine(TheTriple.getTriple(), MCPU, FeaturesStr,
        Options, Reloc::Model::Default, 
        CodeModel::Model::Default,
        OLvl));
  assert(Target && "Could not allocate target machine!");

  TargetLibraryInfo *TLI = new TargetLibraryInfo(TheTriple);
  PM.add(TLI);

  if (const DataLayout *DL = Target->getSubtargetImpl()->getDataLayout())
    M->setDataLayout(DL);
  PM.add(new DataLayoutPass());

  {
    std::error_code Err;
    raw_fd_ostream *Out =          
      new raw_fd_ostream("/dev/null", Err, llvm::sys::fs::OpenFlags::F_None);

    formatted_raw_ostream FOS(*Out);

    Target->addPassesToEmitFile(PM, FOS, 
        TargetMachine::CodeGenFileType::CGFT_Null, false, 
        nullptr, nullptr);

    PM.add(MAST);
    PM.run(*M);
  }
}

CacheAnalysis::CacheAnalysis() {
  InitializeNativeTarget();

  PassRegistry *Registry = PassRegistry::getPassRegistry();
  initializeCore(*Registry);
  initializeCodeGen(*Registry);
  initializeLoopStrengthReducePass(*Registry);
  initializeLowerIntrinsicsPass(*Registry);
  initializeUnreachableBlockElimPass(*Registry);
}

double CacheAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule *Profile, CostEstimatorOptions Opts) const {

  Module *M = Profile->getLLVMModule();

  MachineAST *MAST = new MachineAST(FuncName, Profile);  
  PassManager PM;
  compileModule(M, MAST, PM);

  return MAST->Cost;
}
