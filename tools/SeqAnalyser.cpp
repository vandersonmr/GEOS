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

static cl::list<std::string>
Sequences("sequence", cl::desc("The sequences to be analysed with."),
    cl::OneOrMore);
static cl::alias
SeqAlias("s", cl::desc("Alias for -sequence."), cl::aliasopt(Sequences));

void swap(char &a, char &b) {
  char x = a;
  a = b;
  b = x;
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

  int PAPIEvents[1] = {PAPI_TOT_CYC};

  std::vector<PassSequence> Seqs;

  for (auto S : Sequences) {
    PassSequence PSeq;
    char Old    = '\0';
    auto First  = S.find_first_of("|");
    auto Second = First;
    while (First != std::string::npos) {
      Second = S.find_first_of("|", First+1);
      if (Second == std::string::npos)
        Second = S.length();

      swap(S[Second], Old);
      int Opt = atoi(&S[First+1]);
      PSeq.add(static_cast<OptimizationKind>(Opt));
      swap(S[Second], Old);

      First = Second;
      if (Second == S.length())
        First = std::string::npos;
    }
    Seqs.push_back(PSeq);
  }

  for (auto PSeq : Seqs) {
    auto PO = GEOS::applyPasses(PModule, PSeq);
    if (PO) {
      double Cost = GEOS::analyseCost(PO, Opts);
      double RealCost = 
        (GEOS::getPAPIProfile(PO, ExecutionKind::JIT, PAPIEvents, 1))[0];
      if (Cost < 0.01)
        for (auto &F : *(PO->getLLVMModule())) {
          printf("Function: %s\n", F.getName().str().c_str());
          for (auto &BB : F)
            printf("%s - %ld\n", BB.getName().str().c_str(),
                PO->getBasicBlockFrequency(BB));
        }
      PSeq.printIntVec();
      printf("Cost: %lf\nRealCost: %lf\n", Cost, RealCost);
    }
  }

  printf("----------------------------\n");
  double Cost = GEOS::analyseCost(PModule, Opts);
  double RealCost = 
    (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];
  printf("Cost: %lf\nRealCost: %lf\n", Cost, RealCost);
  return 0;
}

