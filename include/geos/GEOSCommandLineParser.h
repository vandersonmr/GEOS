#include "llvm/Support/CommandLine.h"

#include "geos/CostEstimator/CostEstimatorOptions.h" 
#include "geos/Profiling/GCOVReader.h" 
#include "geos/Profiling/StaticProfiling.h" 
#include "geos/Profiling/CallCostReader.h" 

#include <string>
#include <sstream>

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
      clEnumVal(InstructionCache, "Analyse register use cost."),
      clEnumVal(RegisterUse, "Analyse register use cost."),
      clEnumVal(StaticInstruction,
        "Analyse instruction costs using the same weight for each instruction independent of plataform."),
      clEnumVal(TTIInstruction,
        "Analyse instruction costs with weights that are plataform sensitive."),
      clEnumVal(Branch, "Analyse branch misprediction cost."),
      clEnumVal(Call, "Analyse extern call costs. (Need profiling)"),
      clEnumVal(RandomCost, "Random cost."),
      clEnumValEnd));

static cl::opt<CostEstimatorOptionsSet>
AnalysisSet(cl::desc("Choose an analysis set:"), 
    cl::values(
      clEnumVal(NonArchSensitive, 
        "Set of analysis that does't change for diferents architectures."),
      clEnumVal(ArchSensitive,
        "Set of analysis that does changes for diferents architectures."),
      clEnumValEnd));

static cl::opt<std::string> 
ArgsString("-arguments", cl::desc("The arguments of the program."));
static cl::alias 
ArgsStringAlias("argv", cl::desc("Alias for -arguments"), cl::aliasopt(ArgsString));

namespace gcl {
  void GEOSParseCommandLineOptions(int argc, char** argv) {
    cl::ParseCommandLineOptions(argc, argv);
  }

  CostEstimatorOptions populatePModule(std::shared_ptr<ProfileModule> PModule) {
    if (GCDAFilename.empty() || GCNOFilename.empty()) {
      loadStaticProfiling(PModule.get());
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

      if (!ArgsString.empty()) {
        PModule->Argv.push_back(LLVMFilename);
        std::stringstream Stream(ArgsString);
        std::string Arg;
        while (std::getline(Stream, Arg, ' '))
          if (!Arg.empty())
            PModule->Argv.push_back(Arg);
      }

      loadGCOV(GCDAList, GCNOList, PModule.get());

      for (auto &Buffer : GCNOList)
        delete Buffer;
      for (auto &Buffer : GCDAList)
        delete Buffer;
    }

    if (!CallCost.empty())
      loadCallCost(CallCost, PModule.get());

    CostEstimatorOptions Opts;

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

}
