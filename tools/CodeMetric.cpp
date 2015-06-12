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

using namespace llvm;
using std::string;

static cl::opt<std::string> 
BasePath("metrics", cl::desc("Base of metrics"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
BaseAlias("m", cl::desc("Alias for -metrics"), cl::aliasopt(BasePath));

std::vector<std::pair<string, ModuleMetric>> loadMetricsBase(StringRef Str) {
  std::vector<std::pair<string, ModuleMetric>> Base;
  std::ifstream Infile(Str.str().c_str());
  std::string Line;
  while (std::getline(Infile, Line)) {
    string Name;
    uint64_t N  = 0;
    uint64_t NI = 0;  
    uint64_t NF = 0;  
    uint64_t NEI = 0;  
    uint64_t NEF = 0;  
    uint64_t Fu = 0;  
    uint64_t B = 0;  
    uint64_t L = 0;  
    uint64_t MF = 0;  
    uint64_t MB = 0;  
    uint32_t ML = 0;  
    bool R = false;  

    std::istringstream Iss(Line);
    Iss >> Name >> N >> NI >> NF >> NEI >> NEF >> Fu >> B >> L >> MF >> MB >> 
      ML >> R;

    ModuleMetric MM(N, NI, NF, NEI, NEF, Fu, B, L, MF, MB, ML, R);

    Base.push_back(std::make_pair(Name, MM));
  }
  return Base;
}

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
  
  uint32_t BestDistance = 99;
  string BestName; 
  ModuleMetric *BestMetric;
  for (auto &I : Base) {
    auto D = PModule->getMetrics().distance(I.second); 
    if (D < BestDistance) {
      BestDistance = D;
      BestName = I.first;
      BestMetric = &I.second;
   }
  }

  printf("%s <=> %s | %u\n", BestName.c_str(), LLVMFilename.c_str(), BestDistance);
  printf("%s%s\n\n", 
      PModule->getMetrics().getString().c_str(), 
      BestMetric->getString().c_str());

  return 0;
}
