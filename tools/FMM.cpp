//====== FMM.cpp -  Guide for Exploration of Otimization's Set -*- C++ -*=====//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file has the implementation of the Frequency Maintenance Metrics
/// which measure the quality of GEOS frequency maintenance algorithm.
/// The result is a number between 0 and 1, being 1 a perfect result.
///
//===----------------------------------------------------------------------===//

#include "geos/GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/CommandLine.h"

#include "geos/Profiling/GEOSProfiler.h"

#include <stack>
#include <limits>
#include <random>

static llvm::cl::opt<std::string> 
LLVMFilename("llvm-file", llvm::cl::desc("LLVM file to do time analysis"), 
    llvm::cl::value_desc("filename.ll"),
    llvm::cl::Required);
static llvm::cl::alias 
llAlias("ll", llvm::cl::desc("Alias for -llvm-file"), 
              llvm::cl::aliasopt(LLVMFilename));

static llvm::cl::opt<std::string> 
GEOSProfLibPath("geos-prof-lib", llvm::cl::desc("LLVM GEOS Profiling lib"),
    llvm::cl::value_desc("filename.ll"),
    llvm::cl::Required);
static llvm::cl::alias 
plAlias("pl", llvm::cl::desc("Alias for -geos-prof-lib"), 
              llvm::cl::aliasopt(GEOSProfLibPath));

using namespace llvm;

int main(int argc, char** argv) {
  GEOS::init();
  llvm::cl::ParseCommandLineOptions(argc, argv);

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  Module *MyModule =
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));

  Module *ProfLib =
    parseIRFile(GEOSProfLibPath.c_str(), Error, Context).release();

  std::unique_ptr<GEOSProfiler> GProfiler(new GEOSProfiler);

  GProfiler->populateFrequency(PModule.get(), ProfLib);

  PassSequence Passes;
  Passes.setOLevel(OptLevel::Aggressive);
  Passes.setOSize(OptLevel::None);

  std::shared_ptr<ProfileModule> OM = GEOS::applyPasses(PModule, Passes);

  std::vector<long long unsigned> Frequencies;
  for (auto &F : *OM->getLLVMModule())
    for (auto &BB : F)
      Frequencies.push_back(OM->getBasicBlockFrequency(BB));

  GProfiler->populateFrequency(OM.get(), ProfLib);

  unsigned Rights = 0;
  unsigned ID = 0;
  for (auto &F : *OM->getLLVMModule())
    for (auto &BB : F)
      Rights += Frequencies[ID++] == OM->getBasicBlockFrequency(BB) ? 1 : 0;

  printf("Precision: %f\n", (float) Rights/Frequencies.size());
  return 0;
}
