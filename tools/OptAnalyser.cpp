//=== SeqAnalyser.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*-==//
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

#include <vector>

/*
   static cl::opt<std::string>
   Opt("opt", cl::desc("The optimization to be analysed with."),
   cl::Required);
   static cl::alias
   SeqAlias("o", cl::desc("Alias for -opt."), cl::aliasopt(Opt));
   */

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);
  Module *MyModule =
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  for (auto P = 0; P <= OptimizationKind::tailcallelim; ++P) {
    printf("Optimization No%d\n", P);
    PassSequence PS;
    PS.add(static_cast<OptimizationKind>(P));

    auto PO = GEOS::applyPasses(PModule, PS);
    if (!PO) continue;
    
    double Cost = GEOS::analyseCost(PO, Opts);
    printf("Cost %lf\n", Cost);
  }
  /*

     double Cost, RealCost;
     int PAPIEvents[1] = {PAPI_TOT_CYC};

     Cost     = GEOS::analyseCost(PModule, Opts);
     RealCost = 
     (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];
     printf("O0 Cost: %lf:%lf\n", Cost, RealCost);

     llvm::PassManagerBuilder Builder;
     llvm::legacy::PassManager PM;
     llvm::legacy::FunctionPassManager FPM(PModule->getLLVMModule());

     Builder.SizeLevel = -1;
     Builder.OptLevel  = -1;
     Builder.populateFunctionPassManager(FPM);
     Builder.populateModulePassManager(PM);

     llvm::PassRegistry *PR = llvm::PassRegistry::getPassRegistry();
     const llvm::PassInfo *PI = PR->getPassInfo(Opt);

     if (!PI) {
     printf("Error: Could not create PassInfo.\n");
     return 1;
     }

     llvm::Pass *P = PI->createPass();

     if (P->getPassKind() < 4) {
     printf("Function Pass.\n");
     FPM.add(P);
     } else {
     printf("Module Pass.\n");
     PM.add(P);
     }

     for (auto &Func : *(PModule->getLLVMModule()))
     FPM.run(Func);

     PM.run(*(PModule->getLLVMModule()));

     Cost = GEOS::analyseCost(PModule, Opts);
     RealCost = 
     (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];
     printf("%s applied cost: %lf:%lf\n", Opt.c_str(), Cost, RealCost);

*/
  /*
     int MyOpt = Opt;

     PassSequence PS;
     PS.add(static_cast<OptimizationKind>(MyOpt));

     auto PO = GEOS::applyPasses(PModule, PS);

     if (!PO) return 1;

     printf("Success!\n");
     */

  return 0;
}

