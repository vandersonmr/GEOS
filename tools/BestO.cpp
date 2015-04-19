//===-- BestO.cpp -  Guide for Exploration of Otimization's Set -*- C++ -*-===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements an tool, that when given a llvm code and its 
/// profiling information returns the best otimization option (O1, O2, O3) for 
/// this code.
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/PassManager.h"

#include "GEOSCommandLineParser.h"

#include <stack>
#include <limits>
#include <random>

using namespace llvm;

double 
applyAndGetOCost(ProfileModule* PModule, CostEstimatorOptions &Opts, int O) {
  PassManagerBuilder Builder;
  Builder.SizeLevel = 0;
  Builder.OptLevel = O;
  FunctionPassManager FPMO(PModule->getLLVMModule());
  PassManager PMO;
  Builder.populateFunctionPassManager(FPMO);
  Builder.populateModulePassManager(PMO);

  ProfileModule *PO = GEOS::applyPassesModule(*PModule, FPMO, PMO);
   
  auto Cost = GEOS::analyseCost(PO, Opts);
  
  return Cost;
}

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  ProfileModule *PModule = new ProfileModule(MyModule);
  
  CostEstimatorOptions &Opts = gcl::populatePModule(PModule);

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
