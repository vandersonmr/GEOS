//===--------------- GCOVReader.cpp - Load GCOV Profile -------------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains implemantation of GCOV Profile Loader. 
/// It reads GCDAs and GCNOs files from GCOV profiling. With information 
/// found in this files it sets branch and basic block frequencies.
/// 
/// To instrument a code to generate GCOV profiling using clang:
/// clang -g -O0 --coverage code.c
//
//===----------------------------------------------------------------------===//

#include "geos/Profiling/GCOVReader.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/InstrTypes.h"

using namespace llvm;

std::vector<GCOVFunction*> 
readFunctions(GCOVFile& GF, GCOVBuffer &GCNOBuffer, GCOVBuffer &GCDABuffer) {
  GCOV::GCOVVersion Version;
  std::vector<GCOVFunction*> Functions; 

  uint32_t Checksum;

  GCOVOptions Options(true, true, true, true, true, true, false, false);
  FileInfo FI(Options);

  if (!GCNOBuffer.readGCNOFormat() || !GCDABuffer.readGCDAFormat()) 
    return Functions;
  if (!GCNOBuffer.readGCOVVersion(Version) || 
      !GCDABuffer.readGCOVVersion(Version)) 
    return Functions;

  if (!GCNOBuffer.readInt(Checksum) || !GCDABuffer.readInt(Checksum)) 
    return Functions;

  while (true) {
    if (!GCNOBuffer.readFunctionTag()) break;
    if (!GCDABuffer.readFunctionTag()) break; 
    auto GFun = new GCOVFunction(GF);
    if (!GFun->readGCNO(GCNOBuffer, Version) ||
        !GFun->readGCDA(GCDABuffer, Version))
      return Functions;

    GFun->collectLineCounts(FI);

    Functions.push_back(GFun);
  }

  FI.setRunCount(1);
  FI.setProgramCount(1);

  return Functions;
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
        Profile->setBasicBlockFrequency(BB, (*MBB).getCount());  

        (*MBB).sortDstEdges();
        std::vector<uint32_t> Freqs;
        for (auto BranchFreq = (*MBB).dst_begin(); 
            BranchFreq != (*MBB).dst_end(); ++BranchFreq)  
          Freqs.push_back((*BranchFreq)->Count);
        

        if (Freqs.size() >= 2)  
          Profile->setBranchFrequency(BB, Freqs);

        ++MBB;
      }
    }

    ++iGCDA;
    ++iGCNO;
    
    for (auto &GF : FuncsProfile)
      delete GF; 
  }
}
