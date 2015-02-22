//===------ BBProf.cpp - Add PAPI instructions in each basic block  -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements a Basic Block Pass that adds calls to PAPI functions at
// each Basic Block. Those PAPI instructions measure the number of clocks used 
// by the basic block and print this information in stdout. 
//
//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"

#include "Profiling/StaticProfiling.h"
#include "GEOS.h"

using namespace llvm;

struct StaticProfiling : public FunctionPass {
  static char ID;
  ProfileModule *Profile;

  StaticProfiling(ProfileModule *P) : FunctionPass(ID), Profile(P) {};

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<BlockFrequencyInfo>();
    AU.setPreservesAll();
  }

  bool runOnFunction(Function &F) {
    BlockFrequencyInfo &BFI = getAnalysis<BlockFrequencyInfo>();
    printf("%s %d\n", F.getName().str().c_str(), BFI.getEntryFreq());
    for (auto &BB : F) 
      Profile->setBasicBlockFrequency(BB, BFI.getBlockFreq(&BB).getFrequency());
    return true;
  }
}; 

char StaticProfiling::ID = 0;
void loadStaticProfiling(ProfileModule *Profile) {
  PassManager PM;
  StaticProfiling *Static = new StaticProfiling(Profile);
  PM.add(Static);
  PM.run(*Profile->getLLVMModule());
}
