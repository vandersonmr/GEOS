//===---------------- CallCostReader.cpp - Load Call's Cost ---------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains implemantation of Call Cost loader. It reads from
/// a file the execution time of each external function. This is need for 
/// callcost cost analysis. 
/// 
/// To instrument a code to generate Call Cost using clang:
/// opt -strip-debug -load /usr/local/lib/libLLVMCallCost.so -call-cost test.ll
//
//===----------------------------------------------------------------------===//
#include "Profiling/CallCostReader.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"

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
