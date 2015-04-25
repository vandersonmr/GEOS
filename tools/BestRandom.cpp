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
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/PassManager.h"

#include "GEOSCommandLineParser.h"

#include <stack>
#include <limits>
#include <random>

OptimizationKind getRandomOptimizationKind() {
  std::random_device rd;
  std::default_random_engine e1(rd());
  std::uniform_int_distribution<int> uniform_dist(0, 
      OptimizationKind::LoadCombine);
  int Rand = uniform_dist(e1);
  return static_cast<OptimizationKind>(Rand);
}

void randomiclyPopulate(FunctionPassManager &PM, int NumOfOptimizations = 60) {
  for (int i = 0; i < NumOfOptimizations; i++) {
    Pass *P = GEOS::getPass(getRandomOptimizationKind());
    if (P != nullptr) 
      PM.add(P);
  }
}

int main(int argc, char** argv, char* const *envp) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  ProfileModule *PModule = new ProfileModule(MyModule);
  
  CostEstimatorOptions &Opts = gcl::populatePModule(PModule);

  double Cost = GEOS::analyseCost(PModule, Opts);
  double RealCost = 
    GEOS::getRealExecutionTime(PModule, ExecutionKind::JIT, envp);

  PassManagerBuilder Builder;

  ProfileModule *Best = nullptr;
  double BestSpeedup = 1;
  for (int i = 0; i < 100; i++) {
    Builder.SizeLevel = 0;
    Builder.OptLevel = i%3;

    PassManager PM;
    Builder.populateModulePassManager(PM);

    FunctionPassManager FPM(PModule->getLLVMModule());
    randomiclyPopulate(FPM, 20);

    ProfileModule *PO = GEOS::applyPassesModule(*PModule, FPM, PM);

    double NewCost = GEOS::analyseCost(PO, Opts);

    if ((Cost/NewCost) > BestSpeedup) {
      delete Best;
      BestSpeedup = Cost/NewCost;
      Best = PO;
      printf("%lf\n", BestSpeedup);
    } else {
      delete PO;
    }
  }

  double NewRealCost = 
    GEOS::getRealExecutionTime(Best, ExecutionKind::JIT, envp);

  printf("\nBEST: %lf | %lf \n", BestSpeedup, RealCost/NewRealCost);
  return 0;
}
