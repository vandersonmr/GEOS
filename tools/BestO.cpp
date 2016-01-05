//===-- BestO.cpp -  Guide for Exploration of Otimization's Set -*- C++ -*-===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements a tool, that when given a llvm code and its 
/// profiling information, returns the best otimization option (O1, O2, O3).
///
//===----------------------------------------------------------------------===//

#include "geos/GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"

#include "geos/GEOSCommandLineParser.h"

#include <stack>
#include <limits>
#include <random>

using namespace llvm;

double 
applyAndGetOCost(std::shared_ptr<ProfileModule> PModule, CostEstimatorOptions &Opts, int O) {
  PassSequence Passes;
  Passes.setOLevel(static_cast<OptLevel>(O));
  Passes.setOSize(OptLevel::None);
  std::shared_ptr<ProfileModule> PO = GEOS::applyPasses(PModule, Passes);
  
  if (PO != nullptr) 
    return GEOS::analyseCost(PO, Opts);
  return LONG_MAX;
}

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  auto Cost = GEOS::analyseCost(PModule, Opts);

  auto BestO = 3;
  auto BestCost = Cost; 

  for (int i = 1; i <= 3; i++) {
    auto CostO = applyAndGetOCost(PModule, Opts, i);
    
    if (BestCost < CostO) {
      BestCost = CostO;
      BestO = i;
    }
  }

  printf("-O%d", BestO);

  return 0;
}
