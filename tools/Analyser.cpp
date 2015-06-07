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

using namespace llvm;

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
  printf("%lf\n", Cost);

  return 0;
}
