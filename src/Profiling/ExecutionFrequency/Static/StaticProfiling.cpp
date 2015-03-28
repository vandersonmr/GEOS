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
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"

#include "Profiling/StaticProfiling.h"
#include "GEOS.h"

#include <list>
#include <stack>
#include <unordered_map>
#include <algorithm>

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

    for (auto &BB : F) 
      Profile->setBasicBlockFrequency(BB, 
          BFI.getBlockFreq(&BB).getFrequency() / BFI.getEntryFreq());
    return true;
  }
}; 

enum Mark { Temporary, Permanent, None};

void visit(CallGraphNode &CallNode, 
    std::unordered_map<Function*, Mark> &Marks, 
    std::list<Function*> &SortedList) {

  auto F = CallNode.getFunction();

  if (F == nullptr) return; 

  if (Marks[F] == Mark::Temporary) {
    return;
  }

  if (Marks[F] == Mark::None) {
    Marks[F] = Mark::Temporary;   
    for (auto &ChildNode : CallNode) 
      visit(*ChildNode.second, Marks, SortedList);
    Marks[F] = Mark::Permanent;
    SortedList.push_front(F);
  }
}

bool isUnmarked(std::pair<Function*, Mark> Elem) {
  return Elem.second == Mark::None;
}

std::list<Function*>& topologicalSort(CallGraph &CG) {
  std::list<Function*> &SortedList = *(new std::list<Function*>());
  std::unordered_map<Function*, Mark> Marks; 

  for (auto &F : CG.getModule())  
    Marks[&F] = Mark::None;

  auto Fi = std::find_if(Marks.begin(), Marks.end(), isUnmarked);
  while (Fi != Marks.end()) {
    visit(*CG[Fi->first], Marks, SortedList);
    Fi = std::find_if(Marks.begin(), Marks.end(), isUnmarked);
  }

  return SortedList;
}

void spreadOverCallGraph(ProfileModule *Profile) {
  std::unordered_map<std::string, uint64_t> CallWeights;
  
  auto M = Profile->getLLVMModule();

  CallGraph CG(*M);
  std::list<Function*> &Sorted = topologicalSort(CG);
  CallWeights["main"] = 1;
  
  for (auto F : Sorted) {
    for (auto &BB : *F) {
      auto ExecutionFreq = Profile->getBasicBlockFrequency(BB);
      for (auto &I : BB) {
        if (isa<CallInst>(I)) {
          Function *FuncCalled = cast<CallInst>(I).getCalledFunction();

          if (FuncCalled == nullptr)
            continue;

          CallWeights[FuncCalled->getName().str()] += 
            CallWeights[F->getName().str()] * ExecutionFreq;  
        }
      }
    }
  }

  for (auto FuncFreq : CallWeights) {
    Function &F = *(M->getFunction(FuncFreq.first));
    for (auto &BB : F) 
      Profile->setBasicBlockFrequency(BB, 
            Profile->getBasicBlockFrequency(BB) * FuncFreq.second * 1000);
  }
}

char StaticProfiling::ID = 0;
void loadStaticProfiling(ProfileModule *Profile) {
  int I = 0;
  for (auto &Func : *Profile->getLLVMModule()) 
    for (auto &BB : Func) 
      BB.setName(std::to_string(I++));

  PassManager PM;
  StaticProfiling *Static = new StaticProfiling(Profile);
  PM.add(Static);
  PM.run(*Profile->getLLVMModule());
  spreadOverCallGraph(Profile);
}
