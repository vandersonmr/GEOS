//== CodeMetric.cpp -  Guide for Exploration of Otimization's Set -*- C++ -*==//
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

#include "ProfileModule/ModuleMetric.h"
#include "GEOSCommandLineParser.h"

#include <vector>
#include <limits>
#include <random>
#include <sstream>
#include <string>
#include <fstream>

#include "OfflineLearning/CodeMetricBase.h"
#include "OfflineLearning/AccuracyBase.h"
#include "OfflineLearning/CorrectionBase.h"

using namespace llvm;
using std::string;

static cl::opt<std::string> 
BasePath("metrics", cl::desc("Base of metrics"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
BaseAlias("m", cl::desc("Alias for -metrics"), cl::aliasopt(BasePath));

int main(int argc, char** argv) {
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));

  gcl::populatePModule(PModule);

  auto Base = loadMetricsBase(BasePath);
  
  printf("%s <=> %s\n", getNearestMetric(PModule, Base).c_str(), LLVMFilename.c_str());

  return 0;
}
