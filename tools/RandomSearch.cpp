//== BestRandom.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*-==//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements a tool that, when given a llvm code and its 
/// profiling information, returns the best otimization sequence from a randomic
/// range.
///
//===----------------------------------------------------------------------===//

#include "geos/GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"

#include "geos/GEOSCommandLineParser.h"
#include "geos/OfflineLearning/CodeMetricBase.h"
#include "geos/OfflineLearning/AccuracyBase.h"
#include "geos/OfflineLearning/CorrectionBase.h"
#include "geos/OfflineLearning/OptAccuracyBase.h"

#include <vector>
#include <limits>
#include <random>
#include <signal.h>
#include <stdio.h>
#include <setjmp.h>
#include "papi.h"
#include <list>

#include <cstdlib>
#include <ctime>

static cl::opt<std::string> 
MBasePath("metrics", cl::desc("Base of metrics"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
MBaseAlias("m", cl::desc("Alias for -metrics"), cl::aliasopt(MBasePath));

static cl::opt<std::string> 
ABasePath("accuracy", cl::desc("Base of Accuracy"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
ABaseAlias("a", cl::desc("Alias for -accuracy"), cl::aliasopt(ABasePath));

static cl::opt<std::string> 
CBasePath("correction-folder", cl::desc("Folder with corrections"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
CBaseAlias("cf", cl::desc("Alias for -correction-folder"), cl::aliasopt(CBasePath));

static cl::opt<std::string> 
OABasePath("opt-accuracy-folder", cl::desc("Folder with accuracy for each otimization"), 
    cl::value_desc(".txt"),
    cl::Required);
static cl::alias 
OABaseAlias("oaf", cl::desc("Alias for -opt-accuracy"), cl::aliasopt(OABasePath));

PassSequence randomWalk(PassSequence Start, int Alpha) {
  PassSequence Seed;
  Seed.randomize(Alpha);
  for (auto I : Seed) 
    Start[rand() % Start.size()] = I;
  return Start;
}

#define SIZE 70

int main(int argc, char** argv) {
  std::srand(std::time(0));
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);

  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  auto MetricBase   = loadMetricsBase(MBasePath);
  auto AccuracyBase = loadAccuracyBase(ABasePath);
  auto NearestMetricName = getNearestMetric(PModule, MetricBase);
  double EstimatedAccuracy = 
    getAccuracyFor(NearestMetricName, Opts, AccuracyBase);

  auto CorrectionBase = 
    loadCorrectionBase(CBasePath+"/"+NearestMetricName+".estr");
  auto OptAccuracyBase = 
    loadOptAccuracyBase(OABasePath+"/"+NearestMetricName+".ocor");

  int PAPIEvents[1] = {PAPI_TOT_CYC};
  GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1);
  double RealInitCost = 
      (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];

  auto InitCost = GEOS::analyseCost(PModule, Opts); 

  PassSequence BestSequence;
  BestSequence.randomize(SIZE);

  auto InitPO = GEOS::applyPasses(PModule, BestSequence);
  auto InitBestSequenceCost = GEOS::analyseCost(InitPO, Opts) *
                getCorrectionFor(BestSequence, Opts, CorrectionBase) *
                getPassSequenceAccuracy(BestSequence, Opts, OptAccuracyBase);

  std::list<std::pair<PassSequence, double> > BestSequences;
  BestSequences.push_back(
      std::pair<PassSequence, double>(BestSequence, InitBestSequenceCost));

  unsigned MaxSize = 9 / (EstimatedAccuracy  + 2);

  int t = 1;
  int Alpha = 10;
  int Miss = 0;

  while (true) {
    auto Best = BestSequences.front();
    PassSequence Sequence = randomWalk(Best.first, Alpha);
    auto PO = GEOS::applyPasses(PModule, Sequence);
    if (!PO) continue;
    auto Cost = (GEOS::analyseCost(PO, Opts) /
            getCorrectionFor(Sequence, Opts, CorrectionBase)) *
            getPassSequenceAccuracy(Sequence, Opts, OptAccuracyBase);

    if (Cost < Best.second) {
      BestSequences.push_front(std::pair<PassSequence, double>(Sequence, Cost));

      if (BestSequences.size() > MaxSize) 
        BestSequences.pop_back();

      Miss = 0;
      if (Alpha > 1)
        Alpha = 1;
    } else {
      Miss++;
      if (Miss > 5) {
        Miss = 0;
        if (Alpha < SIZE/2)
          Alpha++;
        else 
          break;
      }
    }
    t++;
  }

  double SpeedupReal = 0; 
  double SpeedupEstimated = 0; 
  for (auto &I : BestSequences) {
    auto PO = GEOS::applyPasses(PModule, I.first);
    double RealBestCost = 
        (GEOS::getPAPIProfile(PO, ExecutionKind::JIT, PAPIEvents, 1))[0];

    if (RealInitCost/RealBestCost > SpeedupReal) {
      SpeedupReal = RealInitCost/RealBestCost;
      SpeedupEstimated = InitCost/GEOS::analyseCost(PO, Opts);
    }
  }

  printf("\n%f %f\n", SpeedupEstimated,
      SpeedupReal);

  return 0;
}
