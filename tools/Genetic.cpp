//======= Genetic.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*-==//
////
////              The LLVM Time Cost Analyser Infrastructure
////
////  This file is distributed under the MIT License. See LICENSE.txt for details.
////              
////===----------------------------------------------------------------------===//
/////
///// \file
///// \brief This file implements a tool that, when given a llvm code and its 
///// profiling information, returns the best otimization sequence from a genetic
///// algorithm.
/////
////===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IR/LLVMContext.h"

#include "GEOSCommandLineParser.h"
#include "OfflineLearning/CodeMetricBase.h"
#include "OfflineLearning/AccuracyBase.h"
#include "OfflineLearning/CorrectionBase.h"
#include "OfflineLearning/OptAccuracyBase.h"

#include <vector>
#include <limits>
#include <random>
#include <signal.h>
#include <stdio.h>
#include <setjmp.h>
#include "papi.h"
#include <list>
#include <queue>

#include <cstdlib>
#include <ctime>

#define SIZE 100
#define TSIZE 5
#define NOPT 50
typedef struct Solution {
  PassSequence Sequence;
  double Cost;
  bool isCalculated;

  Solution(PassSequence P, double C = 0, bool isC = false) { 
    Sequence = P;
    Cost = C;
    isCalculated = isC; 
  }

  void setCost(double C) { Cost = C; isCalculated = true; }

  Solution &operator=(Solution rhs) {
    Sequence = rhs.Sequence;
    Cost = rhs.Cost;
    isCalculated = rhs.isCalculated;
    return *this;
  }
} Solution;

struct compareSolution {
  bool operator()(Solution *S1, Solution *S2) const{
    return (S1->Cost > S2->Cost);
  }
};

typedef std::vector<Solution> PopT;

void initializePopulation(PopT &Population) {
  for (int i = 0; i < SIZE; i++) {
    PassSequence Sequence;
    Sequence.randomize(NOPT, true);
    Population.push_back(Solution(Sequence));
  }
}

void evaluate(Solution &S, 
    std::shared_ptr<ProfileModule> PModule, CostEstimatorOptions Opts) {
  if (S.isCalculated) return;
  auto PO = GEOS::applyPasses(PModule, S.Sequence);
  if (!PO) return;
  auto NewCost = GEOS::analyseCost(PO, Opts);
  S.setCost(NewCost);
}

Solution *evaluatePopulation(PopT &Population, 
    std::shared_ptr<ProfileModule> PModule, CostEstimatorOptions Opts) {
  Solution *Best = &Population[0];
  for (auto &I : Population) {
    evaluate(I, PModule, Opts);
    if (I.Cost < Best->Cost && I.isCalculated)
      Best = &I;
  }
  return Best;
}

Solution *selectParent(PopT &Population) {
  std::priority_queue
    <Solution*, std::vector<Solution*>, compareSolution> Tournament;
  std::vector<bool> isInserted(Population.size(), false);

  while (Tournament.size() != TSIZE) {
    int RandomPos = rand() % Population.size();
    if (isInserted[RandomPos]) continue;
    Tournament.push(&Population[RandomPos]);
    isInserted[RandomPos] = true;
  }
  return Tournament.top();
}

Solution crossOver(Solution S1, Solution S2) {
  PassSequence Crossover = S1.Sequence * S2.Sequence;
  return Solution(Crossover);
}

void mutation(Solution &S, double MutationRate) {
  PassSequence MutatedSeq;
  int MaxOpt = static_cast<int>(OptimizationKind::tailcallelim);
  for (unsigned i = 0; i < S.Sequence.size()+1; i++) {
    double RandomNumber = (double)rand() / RAND_MAX;
    bool Mutate = (MutationRate >= RandomNumber);
    if (Mutate) {
      if (i == S.Sequence.size())
        MutatedSeq.add(static_cast<OptimizationKind>(rand() % MaxOpt));
    } else {
      MutatedSeq.add(S.Sequence[i]);
    }
  }
  S.Sequence = MutatedSeq;
}

void updatePopulation(Solution C, Solution *P1, Solution *P2, Solution *Best) {
  Solution *Child;
  if (P1->Cost < P2->Cost)
    Child = P2;
  else
    Child = P1;
  *Child = C;
  
  if (Child->Cost < Best->Cost && Child->isCalculated)
    Best = Child;
}

bool isFinished(time_t Start) {
  time_t total = time(0) - Start;
  printf("Time:%ld\n", total);
  return (total >= 300);
}

int main(int argc, char** argv) {
  srand(time(0));
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);
  Module *MyModule =
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  /*
     auto MetricBase = loadMetricsBase(MBasePath);
     auto AccuracyBase = loadAccuracyBase(ABasePath);
     auto NearestMetricName = getNearestMetric(PModule, MetricBase);
     double EstimatedAccuracy = 
     getAccuracyFor(NearestMetricName, Opts, AccuracyBase);

     auto CorrectionBase =
     loadCorrectionBase(CBasePath+"/"+NearestMetricName+".estr");
     auto OptAccuracyBase =
     loadOptAccuracyBase(OABasePath+"/"+NearestMetricName+".ocor");
     */
  
  int PAPIEvents[1] = {PAPI_TOT_CYC};
  double RealInitCost =
    (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];
  auto InitCost = GEOS::analyseCost(PModule, Opts);

  double MutationRate = 0.01;
  int Cycles = 0;
  PopT Population;

  printf("Starting genetic...\n");

  initializePopulation(Population);
  Solution *Best = evaluatePopulation(Population, PModule, Opts);

  time_t Start = time(0);
  while (!isFinished(Start)) {
    Solution *FirstParent = selectParent(Population);
    Solution *SecondParent = selectParent(Population);
    Solution Child = crossOver(*FirstParent, *SecondParent);
    mutation(Child, MutationRate);
    evaluate(Child, PModule, Opts);
    updatePopulation(Child, FirstParent, SecondParent, Best);
    Cycles += 1;
    printf("Cycles: %d - ", Cycles);
  }

  auto PO = GEOS::applyPasses(PModule, Best->Sequence);
  double RealFinalCost = 
    (GEOS::getPAPIProfile(PO, ExecutionKind::JIT, PAPIEvents, 1))[0];
  double FinalCost = GEOS::analyseCost(PO, Opts);

  double EstimatedSU = FinalCost/InitCost;
  double RealSU = RealFinalCost/RealInitCost;
  printf("\nEstimated Speedup: %f\nReal Speedup: %f\n\nCycles: %d\n", EstimatedSU,
      RealSU, Cycles);

  Best->Sequence.print();
  return 0;
}
