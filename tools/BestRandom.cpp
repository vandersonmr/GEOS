//== BestRandom.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*-==//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements a tool that, when given a llvm code and its 
/// profiling information, returns the best otimization sequence from a randomic
/// range.
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"

#include "GEOSCommandLineParser.h"

#include <stack>
#include <limits>
#include <random>
#include <signal.h>
#include <stdio.h>
#include <setjmp.h>
#include "papi.h"

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  PModule->print("teste");
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);
  int PAPIEvents[1] = {PAPI_TOT_CYC};

  double BestOfBest = 0;
  double BestOfBestEstimation = 0;
  for(int j = 0; j < 5; j++) {
    double Cost = GEOS::analyseCost(PModule, Opts);
    double RealCost = 
      (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];

    std::shared_ptr<ProfileModule> Best;
    PassSequence BestSeq;
    double BestSpeedup = 0;

    for (int i = 0; i < 200; i++) {
      PassSequence Passes;
      std::shared_ptr<ProfileModule> PO;

      while (!PO) {
        Passes.randomize(50, true);
        PO = GEOS::applyPasses(PModule, Passes);
      }

      double NewCost = GEOS::analyseCost(PO, Opts);

      if ((Cost/NewCost) > BestSpeedup) {
        BestSpeedup = Cost/NewCost;
        Best = PO;
        BestSeq = Passes;
      } 
    }
    BestSeq.print();
    double NewRealCost = (double)
      (GEOS::getPAPIProfile(Best, ExecutionKind::JIT, PAPIEvents, 1))[0];

    printf("\nBEST: %lf | %lf \n", BestSpeedup, RealCost/NewRealCost);

    if ((RealCost/NewRealCost) > BestOfBest) {
      BestOfBest = RealCost/NewRealCost;
      BestOfBestEstimation = BestSpeedup;
    }
  }
  
  printf("\nBEST OF BEST: %lf | %lf \n", BestOfBestEstimation, BestOfBest);
  return 0;
}
