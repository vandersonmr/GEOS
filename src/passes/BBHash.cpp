//===- bb-prof.cpp - Add PAPI instructions in each basic block  -----------===//
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

#include "llvm/Analysis/BBDescriptor.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <sstream>

using namespace llvm;

#define DEBUG_TYPE "bb-hash"

namespace {
  struct BBHash : public ModulePass {
    private:
      StringRef generateHash(BasicBlock &BB) {
        BBDescriptor BBHashGenerator(BB);

        return BBHashGenerator.getString();
      }

      bool runOnBasicBlock(BasicBlock &BB, int id) {
        if (BB.getInstList().size() > 3) {
          outs() << id << ": " << generateHash(BB) << "\n";
        } 
        return false;
      }

      virtual void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesCFG();
      }

    public:
      static char ID; 
      BBHash() : ModulePass(ID) {}

      bool runOnModule(Module &M) override {
        int i = 0;
        for (auto &F : M) 
          for (auto &BB : F)
            runOnBasicBlock(BB, i++);

        return false;
      }
  };
}

char BBHash::ID = 0;
static RegisterPass<BBHash> Y("bb-hash", "BB-Hash for Basic Block database");
