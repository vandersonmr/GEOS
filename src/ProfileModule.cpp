//===-- ProfileModule.cpp -  The Profile Module -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the Profile Module. Which
/// encapsulate a LLVMModule and also the profiling information of this module. 
///
//===----------------------------------------------------------------------===//

#include "ProfileModule.h"

#include "llvm/Transforms/Utils/Cloning.h"

using namespace llvm;

ProfileModule::ProfileModule(Module* M, 
    std::list<MemoryBuffer*> GCDA, 
    std::list<MemoryBuffer*> GCNO) {

  LGCNO = GCNO;
  LGCDA = GCDA;
  LLVMModule = M;

  std::list<MemoryBuffer*>::iterator iGCDA = GCDA.begin();
  std::list<MemoryBuffer*>::iterator iGCNO = GCNO.begin();
  while (iGCDA != GCDA.end() && iGCNO != GCNO.end()) {
    llvm::GCOVFile GF;

    // FIXME! Using only one file. The last.
    GCOVBuffer GCNO_GB(*iGCNO);
    GCOVBuffer GCDA_GB(*iGCDA);

    Profiles = readFunctions(GF, GCNO_GB, GCDA_GB);
    break;
    // FIXME!
  
    iGCDA++;
    iGCNO++;
  }
}

Module* ProfileModule::getLLVMModule() const {
  return LLVMModule;
}

std::vector<llvm::GCOVFunction*> 
ProfileModule::getProfile() const {
  return Profiles;
}
    
std::vector<std::pair<Function*, uint64_t>> 
ProfileModule::getFuncsAndFreqs() const {

  std::vector<std::pair<Function*, uint64_t>> FuncsAndFreqs;

  for(auto& FreqFunc : Profiles) {
    Function* Func = LLVMModule->getFunction(FreqFunc->getName());
    uint64_t Freq = FreqFunc->getEntryCount();
    FuncsAndFreqs.push_back(
        std::pair<Function*, uint64_t>(Func, Freq));
  }

  return FuncsAndFreqs;
}

ProfileModule* ProfileModule::getCopy() const {
  Module *NewModule = CloneModule(getLLVMModule());
  return new ProfileModule(NewModule, LGCDA, LGCNO); 
}

std::vector<GCOVFunction*>
ProfileModule::readFunctions(GCOVFile& GF, GCOVBuffer &GCNOBuffer, 
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
