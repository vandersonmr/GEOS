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
#include "llvm/IR/InstrTypes.h"

#include "Profiling/GCOVReader.h"

using namespace llvm;

std::vector<GCOVFunction*> readFunctions(GCOVFile& GF, GCOVBuffer &GCNOBuffer, 
    GCOVBuffer &GCDABuffer) {

  GCOV::GCOVVersion Version;
  std::vector<GCOVFunction*> *Functions = 
    new std::vector<GCOVFunction*>; 

  uint32_t Checksum;

  GCOVOptions Options(true, true, true, true, true, true, false, false);
  FileInfo FI(Options);

  if (!GCNOBuffer.readGCNOFormat() || !GCDABuffer.readGCDAFormat()) 
    return *Functions;
  if (!GCNOBuffer.readGCOVVersion(Version) || 
      !GCDABuffer.readGCOVVersion(Version)) 
    return *Functions;

  if (!GCNOBuffer.readInt(Checksum) || !GCDABuffer.readInt(Checksum)) 
    return *Functions;

  while (true) {
    if (!GCNOBuffer.readFunctionTag()) break;
    if (!GCDABuffer.readFunctionTag()) break; 
    auto GFun = new GCOVFunction(GF);
    if (!GFun->readGCNO(GCNOBuffer, Version) ||
        !GFun->readGCDA(GCDABuffer, Version))
      return *Functions;

    GFun->collectLineCounts(FI);

    Functions->push_back(GFun);
  }

  FI.setRunCount(1);
  FI.setProgramCount(1);

  return *Functions;
}

void loadGCOV(std::vector<MemoryBuffer*> GCDAs, 
    std::vector<MemoryBuffer*> GCNOs, ProfileModule *Profile) {

  auto I = 0;
  for (auto &Func : *Profile->getLLVMModule()) 
    for (auto &BB : Func)
      BB.setName(std::to_string(I++));

  std::vector<MemoryBuffer*>::iterator iGCDA = GCDAs.begin();
  std::vector<MemoryBuffer*>::iterator iGCNO = GCNOs.begin();

  while (iGCDA != GCDAs.end() && iGCNO != GCNOs.end()) {
    llvm::GCOVFile GF;

    GCOVBuffer GCNO_GB(*iGCNO);
    GCOVBuffer GCDA_GB(*iGCDA);

    std::vector<GCOVFunction*> FuncsProfile =
      readFunctions(GF, GCNO_GB, GCDA_GB);

    auto LLVMModule = Profile->getLLVMModule();

    for (auto &FreqFunc : FuncsProfile) {
      Function *LLVMFunc = LLVMModule->getFunction(FreqFunc->getName());
      assert(LLVMFunc != nullptr
          && "Trying to access a LLVM Function that don't exist!");

      auto MBB = FreqFunc->block_begin(); 
      ++MBB;
      ++MBB;
      for(auto &BB : *LLVMFunc) {
        Profile->setBasicBlockFrequency(BB, (*MBB).get()->getCount());  
        (*MBB)->sortDstEdges();
        std::vector<uint32_t> Freqs;
        for (auto BranchFreq = (*MBB)->dst_begin(); 
            BranchFreq != (*MBB)->dst_end(); ++BranchFreq) { 
          Freqs.push_back((*BranchFreq)->Count);
        }

        if (Freqs.size() >= 2)  
          Profile->setBranchFrequency(BB, Freqs);

        ++MBB;
      }
    }

    ++iGCDA;
    ++iGCNO;
  }

}
