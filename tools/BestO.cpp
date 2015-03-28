//===-- GEOS.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the GEOS's main functions. Which
/// are responsable for interfacing heuristics that want to explore, in a 
/// fast way, the otmization's space set. 
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/PassManager.h"

#include "CostEstimator/CostEstimatorOptions.h" 
#include "Profiling/GCOVReader.h" 
#include "Profiling/StaticProfiling.h" 
#include "Profiling/CallCostReader.h" 

#include <stack>
#include <limits>
#include <random>

using namespace llvm;

static cl::opt<std::string> 
LLVMFilename("llvm-file", cl::desc("LLVM file to do time analysis"), 
    cl::value_desc("filename.ll"),
    cl::Required);
static cl::alias 
llAlias("ll", cl::desc("Alias for -llvm-file"), cl::aliasopt(LLVMFilename));

static cl::list<std::string> 
GCNOFilename("gcno", cl::desc("One or more GCOV GCNO files"), 
    cl::value_desc("filename.gcno"), cl::ZeroOrMore);
static cl::alias 
goAlias("go", cl::desc("Alias for -gcno"), cl::aliasopt(GCNOFilename));

static cl::list<std::string> 
GCDAFilename("gcda", cl::desc("One or more GCOV GCDA files"), 
    cl::value_desc("filename.gcda"), cl::ZeroOrMore);
static cl::alias 
gaAlias("ga", cl::desc("Alias for -gcda"), cl::aliasopt(GCDAFilename));

static cl::opt<double> 
CPUFreq("cpu-freq", cl::desc("defines CPU Clock rate."), 
    cl::value_desc("CPU Clock"));
static cl::alias 
CPUAlias("f", cl::desc("Alias for -cpu-freq"), cl::aliasopt(CPUFreq));

static cl::opt<double> 
BranchFreq("-branch-freq", cl::desc("defines branch misprediction rate."), 
    cl::value_desc("branch misprediction frequency"));
static cl::alias 
BFAlias("brf", cl::desc("alias for -branch-freq"), cl::aliasopt(BranchFreq));

static cl::opt<double> 
BranchCost("-branch-cost", cl::desc("defines branch misprediction cost."), 
    cl::value_desc("branch misprediction cost"));
static cl::alias 
BCalias("brc", cl::desc("alias for -branch-cost"), cl::aliasopt(BranchCost));

static cl::opt<std::string> 
CallCost("-call", cl::desc("defines callcost file."), 
    cl::value_desc("CallCost"));
static cl::alias 
CallCostAlias("c", cl::desc("Alias for -call"), cl::aliasopt(CallCost));

static cl::list<CostAnalysisKind>
Analysis(cl::desc("Choose one or more analysis method:"), 
    cl::values(
      clEnumVal(Cache, "Analyse cache cost."),
      clEnumVal(StaticInstruction,
        "Analyse instruction costs using the same weight for each instruction independent of plataform."),
      clEnumVal(TTIInstruction,
        "Analyse instruction costs with weights that are plataform sensitive."),
      clEnumVal(Branch, "Analyse branch misprediction cost."),
      clEnumVal(Call, "Analyse extern call costs. (Need profiling)"),
      clEnumValEnd));

static cl::opt<CostEstimatorOptionsSet>
AnalysisSet(cl::desc("Choose an analysis set:"), 
    cl::values(
      clEnumVal(NonArchSensitive, 
        "Set of analysis that does't change for diferents architectures."),
      clEnumVal(ArchSensitive,
        "Set of analysis that does changes for diferents architectures."),
      clEnumValEnd));

CostEstimatorOptions& populatePModule(ProfileModule *PModule) {
  if (GCDAFilename.empty() || GCNOFilename.empty()) {
    loadStaticProfiling(PModule);
  } else {
    std::vector<MemoryBuffer*> GCNOList;
    std::vector<MemoryBuffer*> GCDAList;

    cl::list<std::string>::iterator iGCDA = GCDAFilename.begin();
    cl::list<std::string>::iterator iGCNO = GCNOFilename.begin();
    while (iGCDA != GCDAFilename.end() && iGCNO != GCNOFilename.end()) {
      GCNOList.push_back(MemoryBuffer::getFile(*iGCNO).get().release());
      GCDAList.push_back(MemoryBuffer::getFile(*iGCDA).get().release()); 
      ++iGCDA;
      ++iGCNO;
    }

    loadGCOV(GCDAList, GCNOList, PModule);
  }

  if (!CallCost.empty())
    loadCallCost(CallCost, PModule);

  CostEstimatorOptions &Opts = *(new CostEstimatorOptions);

  if (CPUFreq)
    Opts.CPUClockInGHz = CPUFreq;
  if (BranchFreq)
    Opts.BranchMispredictionFrequency = BranchFreq;
  if (BranchCost)
    Opts.BranchMispredictionCost = BranchCost;

  Opts.AnalysisActivated = getAnalysisFor(AnalysisSet);

  if (!Analysis.empty()) {
    Opts.AnalysisActivated.clear();
    for (auto Analyse : Analysis) {
      if (Analyse == CostAnalysisKind::Call && CallCost.empty()) {
        fprintf(stderr, "CallCost analysis needs a CallCost profiling file (-c).");
        exit(1);   
      }
      Opts.AnalysisActivated.push_back(Analyse);
    }
  } else if (AnalysisSet == CostEstimatorOptionsSet::ArchSensitive) {
    if (CallCost.empty()) {
      fprintf(stderr, "CallCost analysis needs a CallCost profiling file (-c).");
      exit(1);   
    }
  }

  return Opts;
} 

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

  cl::ParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  ProfileModule *PModule = new ProfileModule(MyModule);
  
  CostEstimatorOptions &Opts = populatePModule(PModule);

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
