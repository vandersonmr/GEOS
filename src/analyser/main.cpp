//===--------- analyser/main.cpp - BB Cost Estimative -*- C++ -*- ---------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of the program cost 
/// analyser. It uses the the AnalysisMethods to calculate the cost of each
/// function. 
///
//===----------------------------------------------------------------------===//

#include "AnalysisMethod.h"
#include "CostEstimator.h"
#include "GEOS.h"

#include "llvm/Support/raw_ostream.h"

using namespace llvm;

static cl::opt<std::string> 
LLVMFilename("llvm-file", cl::desc("LLVM file to do time analysis"), 
    cl::value_desc("filename.ll"),
    cl::Required);
static cl::alias 
llAlias("ll", cl::desc("Alias for -llvm-file"), cl::aliasopt(LLVMFilename));

static cl::list<std::string> 
GCNOFilename("gcno", cl::desc("One or more GCOV GCNO files"), 
    cl::value_desc("filename.gcno"), cl::OneOrMore);
static cl::alias 
goAlias("go", cl::desc("Alias for -gcno"), cl::aliasopt(GCNOFilename));

static cl::list<std::string> 
GCDAFilename("gcda", cl::desc("One or more GCOV GCDA files"), 
    cl::value_desc("filename.gcda"), cl::OneOrMore);
static cl::alias 
gaAlias("ga", cl::desc("Alias for -gcda"), cl::aliasopt(GCDAFilename));

static cl::opt<AnalysisMethodKind> 
OptAnalysisMethod(cl::desc("Choose an analysis method:"),
    cl::values(
      clEnumVal(instM, "Basic blocks are weighed by their number of instruction"),
      clEnumVal(instCostM, 
        "Basic blocks are weighed by the sum up of all instruction cost"),
      clEnumVal(hashWM, 
        "Basic blocks are weighed by similar basic block where which dimension has also a weight in the DB"),
      clEnumVal(randM, "Basic blocks are weighed randomicly"),
      clEnumVal(freqM, "No weight to basic blocks"),
      clEnumVal(hashPlusInstM, "Sum of the inst weight and hash weight"),
      clEnumValEnd));

static cl::opt<std::string> DatabaseFilename("database", 
    cl::desc("Hashs database to hashM analysis"), cl::value_desc("filename"));
static cl::alias 
dbAlias("db", cl::desc("Alias for -database"), cl::aliasopt(DatabaseFilename));

static cl::opt<double> 
CPUFreq("cpu-freq", cl::desc("defines CPU Clock rate."), 
    cl::value_desc("CPU Clock"),
    cl::Required);
static cl::alias 
CPUAlias("f", cl::desc("Alias for -cpu-freq"), cl::aliasopt(CPUFreq));


int main(int argc, char** argv) {
  LLVMContext Context;
  SMDiagnostic Error;

  cl::ParseCommandLineOptions(argc, argv);

  std::unique_ptr<Module> MyModule = parseIRFile(LLVMFilename.c_str(),
      Error, Context);

  std::vector<MemoryBuffer*> GCNOList;
  std::vector<MemoryBuffer*> GCDAList;

  cl::list<std::string>::iterator iGCDA = GCDAFilename.begin();
  cl::list<std::string>::iterator iGCNO = GCNOFilename.begin();
  while (iGCDA != GCDAFilename.end() && iGCNO != GCNOFilename.end()) {
    GCNOList.push_back(MemoryBuffer::getFileOrSTDIN(*iGCNO).get().release());
    GCDAList.push_back(MemoryBuffer::getFileOrSTDIN(*iGCDA).get().release()); 
    ++iGCDA;
    ++iGCNO;
  }

  AnalysisMethod *Analyser = 
    GEOS::getAnalyser((AnalysisMethodKind) OptAnalysisMethod, 
      DatabaseFilename.c_str());

  ProfileModule PModule(&(*MyModule), GCDAList, GCNOList);

  printf("%lf\n", GEOS::analyseExecutionTime(PModule, Analyser) / 
      (CPUFreq * std::pow(10, 9)));

  return 0;
}
