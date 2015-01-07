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

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"

#include <stack>
#include <limits>

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

OptimizationKind getRandomPass() {
   return (OptimizationKind) 
        ((rand() % OptimizationKind::LoadCombine)+ 1);
}

void printModule(ProfileModule* P, int Id) {
  char FileName[20];
  sprintf(FileName, "%d.ll", Id);
  std::error_code Err;
  raw_fd_ostream *Out = 
    new raw_fd_ostream(FileName, Err, llvm::sys::fs::OpenFlags::F_Excl);
  WriteBitcodeToFile(P->getLLVMModule(), *Out);
  Out->flush();
  delete Out;
}

int main(int argc, char** argv) {
  unsigned int time_ui = time(NULL) ;
  srand( time_ui );
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  cl::ParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::list<MemoryBuffer*> GCNOList;
  std::list<MemoryBuffer*> GCDAList;

  cl::list<std::string>::iterator iGCDA = GCDAFilename.begin();
  cl::list<std::string>::iterator iGCNO = GCNOFilename.begin();
  // FIXME!
  //while (iGCDA != GCDAFilename.end() && iGCNO != GCNOFilename.end()) {
    auto GCNO = MemoryBuffer::getFileOrSTDIN(*iGCNO);
    auto GCDA = MemoryBuffer::getFileOrSTDIN(*iGCDA);
    GCNOList.push_back(GCNO.get().get());
    GCDAList.push_back(GCDA.get().get());
  //}

  ProfileModule *PModule = new ProfileModule(MyModule, GCDAList, GCNOList);

  ProfileModule *Optimized = PModule;

  double StartTime = GEOS::analyseExecutionTime(*Optimized, 
        (AnalysisMethods) OptAnalysisMethod, DatabaseFilename.c_str()) 
      / 100000000.0;

  double BestValue = std::numeric_limits<double>::max();
  std::vector<OptimizationKind> Optimizations;
  int Try = 10;
  int i = 0;

  while (i < 20) {
    OptimizationKind OptChoosed = getRandomPass();
    if (GEOS::getPass(OptChoosed) == nullptr) continue;
    
    Optimizations.push_back(OptChoosed);

    FunctionPassManager FPM(Optimized->getLLVMModule());

    for (auto OptKind : Optimizations) { 
      Pass *Aux = GEOS::getPass(OptKind);
      FPM.add(Aux);
    }

    FPM.doInitialization();
    ProfileModule* Candidate = GEOS::applyPasses(*Optimized, FPM);
    FPM.doFinalization();

    double ExecutionTime = GEOS::analyseExecutionTime(*Optimized, 
        (AnalysisMethods) OptAnalysisMethod, DatabaseFilename.c_str());

    if (ExecutionTime <= BestValue) {

      i++;
      delete Optimized;
      printf("%d : %s : ", i, GEOS::getPass(OptChoosed)->getPassName());
      BestValue = ExecutionTime;
      Optimized = Candidate;

      printModule(Optimized, i);

      printf("%lf\n", GEOS::analyseExecutionTime(*Optimized, 
          (AnalysisMethods) OptAnalysisMethod, DatabaseFilename.c_str()) 
          / 100000000.0);

    } else {
      delete Candidate;
      Optimizations.pop_back(); 
      Try--;
      if (Try == 0) { 
        printf("SpeedUp : %lf\n", 
            StartTime / (GEOS::analyseExecutionTime(*Optimized, 
                (AnalysisMethods) OptAnalysisMethod, DatabaseFilename.c_str()) 
              / 100000000.0));

        return 0;
      }
    }
  }

  printf("SpeedUp : %lf\n", StartTime / (GEOS::analyseExecutionTime(*Optimized, 
        (AnalysisMethods) OptAnalysisMethod, DatabaseFilename.c_str()) 
      / 100000000.0));

  return 0;
}
