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

#include "Profiling/CallCostReader.h"

using namespace llvm;

void loadCallCost(StringRef Filename, ProfileModule *Profile) {
  ErrorOr<std::unique_ptr<MemoryBuffer>> CallCostFileBuffer =
    MemoryBuffer::getFile(Filename);

  assert(CallCostFileBuffer && "Impossible to open the CallCost file.");

  std::pair<StringRef, StringRef> LineAndTail =
    (*CallCostFileBuffer)->getBuffer().split('\n');

  auto Module = Profile->getLLVMModule();

  for (auto &Func : *Module) {
    for (auto &BB : Func) {
      for (auto &I : BB) { 
        if (Profile->hasID(I) && !LineAndTail.first.empty()) {
          int   CallID;
          double Cost;

          sscanf(LineAndTail.first.str().c_str(), "%d: %lf", &CallID, &Cost);

          if (CallID == Profile->getID(I)) {
            Profile->setCallCost(cast<CallInst>(I), Cost);
            LineAndTail = LineAndTail.second.split('\n');
          } else {
            Profile->setCallCost(cast<CallInst>(I), 0);
          }

        }
      }
    }
  }
} 
