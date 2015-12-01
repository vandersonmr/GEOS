//======= OptTest.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*-==//
////
////              The LLVM Time Cost Analyser Infrastructure
////
////  This file is distributed under the MIT License. See LICENSE.txt for details.
////              
////===----------------------------------------------------------------------===//
/////
///// \file
///// \brief This tests the LLVM optimizations.
/////
////===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"

#include "GEOSCommandLineParser.h"

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);
  Module *MyModule =
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  for (int O = 0; O <= 50; ++O) {
    PassSequence PSeq;
    PSeq.randomize(10);

    PSeq.printIntVec();
    auto PO = GEOS::applyPasses(PModule, PSeq);
    double Cost;
    if (PO) {
      Cost = GEOS::analyseCost(PO, Opts);
      printf("Cost: %lf\n", Cost);
    }
    printf("DONE\n");
  }

  return 0;
}
