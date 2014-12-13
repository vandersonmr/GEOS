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

static cl::opt<AnalysisMethods> 
OptAnalysisMethod(cl::desc("Choose an analysis method:"),
    cl::values(
      clEnumVal(instM, "Basic blocks are weighed by their number of instruction"),
      clEnumVal(instCostM, 
        "Basic blocks are weighed by the sum up of all instruction cost"),
      clEnumVal(hashM, 
        "Basic blocks are weighed by similar basic block in the DB"),
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

std::vector<std::unique_ptr<GCOVFunction>>
readFunctions(GCOVFile& GF, GCOVBuffer &GCNOBuffer, GCOVBuffer &GCDABuffer) {
  GCOV::GCOVVersion Version;
  std::vector<std::unique_ptr<GCOVFunction>> Functions; 
  uint32_t Checksum;

  GCOVOptions Options(true, true, true, true, true, true, false, false);
  FileInfo FI(Options);

  if (!GCNOBuffer.readGCNOFormat() || !GCDABuffer.readGCDAFormat()) 
    return Functions;
  if (!GCNOBuffer.readGCOVVersion(Version) || 
      !GCDABuffer.readGCOVVersion(Version)) 
    return Functions;

  if (!GCNOBuffer.readInt(Checksum) || !GCDABuffer.readInt(Checksum)) 
    return Functions;

  while (true) {
    if (!GCNOBuffer.readFunctionTag()) break;
    if (!GCDABuffer.readFunctionTag()) break; 
    auto GFun = make_unique<GCOVFunction>(GF);
    if (!GFun->readGCNO(GCNOBuffer, Version) ||
        !GFun->readGCDA(GCDABuffer, Version))
      return Functions;

    GFun->collectLineCounts(FI);

    Functions.push_back(move(GFun));
  }

  FI.setRunCount(1);
  FI.setProgramCount(1);

  return Functions;
}

int main(int argc, char** argv) {
  LLVMContext Context;
  SMDiagnostic Error;

  cl::ParseCommandLineOptions(argc, argv);

  std::unique_ptr<Module> MyModule = parseIRFile(LLVMFilename.c_str(),
      Error, Context);

  AnalysisMethod *Analyser;

  switch (OptAnalysisMethod) {
    case hashM:
      if (!DatabaseFilename.empty())
        Analyser = new HashMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case hashWM:
      if (!DatabaseFilename.empty())
        Analyser = new HashWeightedMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case instM:
      Analyser = new InstructionMethod();
      break;
    case instCostM:
      Analyser = new InstructionCostMethod();
      break;
    case randM:
      Analyser = new RandomMethod();
      break;
    case freqM:
      Analyser = new FrequencyMethod();
      break;
    case hashPlusInstM:
      if (!DatabaseFilename.empty())
        Analyser = new InstructionPlusHashMethod(DatabaseFilename);
      else
        errs() << "For hashPlusInstM you must pass a database filename with" <<
          " -database\n";
      break;
    default:
      Analyser = new InstructionMethod();
      break;
  }

  double PerformanceMensurment = 0;

  cl::list<std::string>::iterator iGCDA = GCDAFilename.begin();
  cl::list<std::string>::iterator iGCNO = GCNOFilename.begin();
  while (iGCDA != GCDAFilename.end() && iGCNO != GCNOFilename.end()) {
    GCOVFile GF;

    ErrorOr<std::unique_ptr<MemoryBuffer>> GCNO_Buff =
      MemoryBuffer::getFileOrSTDIN(*iGCNO);
    ErrorOr<std::unique_ptr<MemoryBuffer>> GCDA_Buff =
      MemoryBuffer::getFileOrSTDIN(*iGCDA);

    GCOVBuffer GCNO_GB(GCNO_Buff.get().get());
    GCOVBuffer GCDA_GB(GCDA_Buff.get().get());

    auto NewFuncs = readFunctions(GF, GCNO_GB, GCDA_GB);

    for (auto &FreqFunc : NewFuncs) {
      Function *LLVMFunc = MyModule->getFunction(FreqFunc->getName());

      PerformanceMensurment += 
        Analyser->estimateExecutionTime(LLVMFunc, FreqFunc);
    }

    iGCDA++;
    iGCNO++;
  }

  outs() << PerformanceMensurment << "\n";

  return 0;
}
