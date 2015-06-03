//=== Analyser.cpp -  Guide for Exploration of Otimization's Set -*- C++ -*===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements a tool that returns the cost of a given LLVM 
/// code. 
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
#include <sstream>
#include <string>
#include <fstream>

using namespace llvm;

static cl::opt<std::string> 
SequencesFile("seq", cl::desc("list of seq to analyse"), 
    cl::value_desc("test.seq"),
    cl::Required);
static cl::alias 
SeqAlias("s", cl::desc("Alias for -seq"), cl::aliasopt(SequencesFile));

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  ProfileModule *PModule = new ProfileModule(MyModule);

  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  std::ifstream Infile(SequencesFile.c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    std::string Sequence;
    double Runtime;
    unsigned NumInstructionsExec;
    std::istringstream Iss(Line);
    std::getline(Iss, Sequence, ']');
    Iss >> Runtime >> NumInstructionsExec;

    PassSequence Passes;
    Passes.loadString(Sequence);
  
    ProfileModule *PO = GEOS::applyPasses(*PModule, Passes);
    auto Cost = 0.0;
    printf("%s %lf %u", Sequence.c_str(), Runtime, NumInstructionsExec);

    if (PO != nullptr) {
      for (int i = 0; i < 7; i++) {
        Opts.AnalysisActivated.clear();
        Opts.AnalysisActivated.push_back(static_cast<CostAnalysisKind>(i));
        Cost = GEOS::analyseCost(PO, Opts);
        printf(" %lf", Cost);
      }
      printf("\n");
    } else {
      printf("\n");
    }
  }
  return 0;
}
