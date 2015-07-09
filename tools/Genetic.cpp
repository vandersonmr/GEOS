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
#include <float.h>

#include <cstdlib>
#include <ctime>


static cl::opt<std::string> 
MBasePath("metrics", cl::desc("Base of metrics"), 
    cl::value_desc(".txt"));
static cl::alias 
MBaseAlias("m", cl::desc("Alias for -metrics"), cl::aliasopt(MBasePath));

static cl::opt<std::string> 
ABasePath("accuracy", cl::desc("Base of Accuracy"), 
    cl::value_desc(".txt"));
static cl::alias 
ABaseAlias("a", cl::desc("Alias for -accuracy"), cl::aliasopt(ABasePath));

static cl::opt<std::string> 
CBasePath("correction-folder", cl::desc("Folder with corrections"), 
    cl::value_desc(".txt"));
static cl::alias 
CBaseAlias("cf", cl::desc("Alias for -correction-folder"), cl::aliasopt(CBasePath));

static cl::opt<std::string> 
OABasePath("opt-accuracy-folder", cl::desc("Folder with accuracy for each otimization"), 
    cl::value_desc(".txt"));
static cl::alias 
OABaseAlias("oaf", cl::desc("Alias for -opt-accuracy"), cl::aliasopt(OABasePath));

static cl::opt<unsigned> SIZE("pop-size", cl::desc("Size of population"));
static cl::alias SIZEAlias("s", cl::desc("Alias for -pop-size"), 
    cl::aliasopt(SIZE));

static cl::opt<unsigned> BSIZE("opt-list-size", cl::desc("Max size of best sequence list"));
static cl::alias BSIZEAlias("ols", cl::desc("Alias for best-sequence size"), 
    cl::aliasopt(BSIZE));

static cl::opt<unsigned> TSIZE("tournament-size", cl::desc("Max size of tournament"));
static cl::alias TSIZEAlias("ts", cl::desc("Alias for tournament size"), 
    cl::aliasopt(TSIZE));

static cl::opt<unsigned> NOPT("length-solution", cl::desc("Max total time (in seconds)"));
static cl::alias NOPTAlias("len", cl::desc("Alias for time-max"), 
    cl::aliasopt(NOPT));

static cl::opt<unsigned> TIME_MAX("time-max", cl::desc("Max total time (in seconds)"));
static cl::alias TIME_MAXAlias("tm", cl::desc("Alias for time-max"), 
    cl::aliasopt(TIME_MAX));

static cl::opt<unsigned> CYCLE_MAX("cycle-max", cl::desc("Max number of cycles"));
static cl::alias CYCLE_MAXAlias("cm", cl::desc("Alias for cycle-max"), 
    cl::aliasopt(CYCLE_MAX));

static cl::opt<double> MutationRate("mut-rate", cl::desc("Max total time (in seconds)"));
static cl::alias MutationRateAlias("pm", cl::desc("Alias for time-max"), 
    cl::aliasopt(MutationRate));

static cl::opt<double> CrossoverRate("cross-rate", cl::desc("Max total time (in seconds)"));
static cl::alias CrossoverRateAlias("pc", cl::desc("Alias for time-max"), 
    cl::aliasopt(CrossoverRate));

static cl::opt<int> Randomness("randomness", cl::desc("RandomCost"));
static cl::alias RandomnessAlias("rc", cl::desc("Alias for randomness"), 
    cl::aliasopt(Randomness));

#define SIZE_STD 100
#define NOPT_STD 70
#define BSIZE_STD 5
#define TSIZE_STD 5
#define TIME_MAX_STD 300
#define CYCLE_MAX_STD 50

#define CRATE_STD 0.8
#define MRATE_STD 0.01

double getRandomDouble() {
  return rand()/RAND_MAX;
}

// ------------------------------- Types
typedef struct Solution {
  PassSequence Sequence;
  double Cost;
  bool isCalculated;

  Solution() {}
  Solution(PassSequence P, double C = DBL_MAX, bool isC = false) { 
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

class CompareSolution {
  double Accuracy;
  bool getJudgement() const {
    return (Accuracy >= getRandomDouble());
  }

  public:
  CompareSolution(const double A = 1.0) { 
    Accuracy = (A + 1.0)/2; 
  }

  bool operator()(Solution S1, Solution S2) const {
    return ((S1.Cost > S2.Cost) == getJudgement());
  }
};

typedef std::vector<Solution> PopT;
typedef std::priority_queue<Solution, PopT, CompareSolution> BestSeqT;

// ---------------------- Functions
void initializePopulation(PopT &Population) {
  for (unsigned i = 0; i < SIZE; i++) {
    PassSequence Sequence;
    Sequence.randomize(NOPT);
    Population.push_back(Solution(Sequence));
  }
}

bool evaluate(Solution &S, 
    CorrectionBaseT CorrectionBase, OptAccuracyBaseT OptAccuracyBase,
    std::shared_ptr<ProfileModule> PModule, CostEstimatorOptions Opts) {
  if (S.isCalculated) return true;

  auto NewCost = (rand() % 10) + 1;
  if (!Randomness) {
    auto PO = GEOS::applyPasses(PModule, S.Sequence);
    if (!PO) return false;
    NewCost = GEOS::analyseCost(PO, Opts); 
  }  

  if (MBasePath.empty()) {
    auto OptAccuracy = getPassSequenceAccuracy
      (S.Sequence, Opts, OptAccuracyBase);
    NewCost /= getCorrectionFor(S.Sequence, Opts, CorrectionBase);
    NewCost *= OptAccuracy;
  }

  S.setCost(NewCost);
  return true;
}

void evaluatePopulation(PopT &Population, 
    CorrectionBaseT CorrectionBase, OptAccuracyBaseT OptAccuracyBase,
    BestSeqT &BestSequences, std::shared_ptr<ProfileModule> PModule, 
    CostEstimatorOptions Opts, double EstimatedAccuracy) {

  BestSeqT OrderedPop((CompareSolution(EstimatedAccuracy)));
  BestSequences = BestSeqT(CompareSolution(EstimatedAccuracy));

  for (auto &I : Population) {
    evaluate(I, CorrectionBase, OptAccuracyBase, PModule, Opts);
    OrderedPop.push(I);
  }

  for (unsigned i = 0; i < BSIZE; i++) {
    BestSequences.push(OrderedPop.top());
    OrderedPop.pop();
  }
}

PopT selection(PopT Population, double EstimatedAccuracy) {
  unsigned MSize = Population.size()/2, PSize = Population.size();
  PopT MatingPool;
  while (MatingPool.size() < MSize) {
    BestSeqT Tournament((CompareSolution(EstimatedAccuracy)));
    for (unsigned i = 0; i < TSIZE; i++) {
      int Gene = rand() % PSize;
      Tournament.push(Population[Gene]);
    }
    MatingPool.push_back(Tournament.top());
  }
  return MatingPool;
}

PopT crossover(PopT MatingPool) {
  PopT NewPopulation;
  int MSize = (int)MatingPool.size();
  while (NewPopulation.size() <= SIZE) {
    int ParentI = rand() % MSize;
    int ParentJ = rand() % MSize;
    if (CrossoverRate >= getRandomDouble()) {
      PassSequence Crossover = MatingPool[ParentI].Sequence * 
        MatingPool[ParentJ].Sequence;
      NewPopulation.push_back(Solution(Crossover));
    } else {
      NewPopulation.push_back(MatingPool[ParentI]);
      NewPopulation.push_back(MatingPool[ParentJ]);
    }
  }
  return NewPopulation;
}

void mutation(PopT &Population) {
  PassSequence MutatedSeq;
  int MaxOpt = static_cast<int>(OptimizationKind::tailcallelim);
  for (auto S : Population) {
    if (S.isCalculated) continue;
    for (unsigned i = 0; i < S.Sequence.size(); i++) {
      if (MutationRate >= getRandomDouble()) {
        MutatedSeq.add(static_cast<OptimizationKind>(rand() % MaxOpt));
      } else {
        MutatedSeq.add(S.Sequence[i]);
      }
    }
    S.Sequence = MutatedSeq;
  }
}

bool isFinished(time_t Start, int Cycles) { 
  time_t total = time(0) - Start;
  if (CYCLE_MAX && TIME_MAX)
    return (total >= (int)TIME_MAX || Cycles >= (int)CYCLE_MAX);
  else if (TIME_MAX)
    return (total >= (int)TIME_MAX); 
  else
    return (Cycles >= (int)CYCLE_MAX);
}

int main(int argc, char** argv) {
  srand(time(0));
  GEOS::init();

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Error;

  gcl::GEOSParseCommandLineOptions(argc, argv);
  Module *MyModule =
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();

  if (!SIZE) SIZE = SIZE_STD;
  if (!BSIZE) BSIZE = BSIZE_STD;
  if (!TSIZE) TSIZE = TSIZE_STD;
  if (!NOPT) NOPT = NOPT_STD;
  if (!TIME_MAX && !CYCLE_MAX) TIME_MAX = TIME_MAX_STD;
  if (!MutationRate) MutationRate = MRATE_STD;
  if (!CrossoverRate) CrossoverRate = CRATE_STD;

  std::shared_ptr<ProfileModule> PModule(new ProfileModule(MyModule));
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);

  double EstimatedAccuracy = 1;
  OptAccuracyBaseT OptAccuracyBase;
  CorrectionBaseT CorrectionBase;
  if (!MBasePath.empty() && !ABasePath.empty() && !CBasePath.empty() && !OABasePath.empty()) {
    auto MetricBase = loadMetricsBase(MBasePath);
    auto AccuracyBase = loadAccuracyBase(ABasePath);
    auto NearestMetricName = getNearestMetric(PModule, MetricBase);
    EstimatedAccuracy = 
      getAccuracyFor(NearestMetricName, Opts, AccuracyBase);

    CorrectionBase =
      loadCorrectionBase(CBasePath+"/"+NearestMetricName+".estr");
    OptAccuracyBase =
      loadOptAccuracyBase(OABasePath+"/"+NearestMetricName+".ocor");
  }


  int PAPIEvents[1] = {PAPI_TOT_CYC};
  double RealInitCost =
    (GEOS::getPAPIProfile(PModule, ExecutionKind::JIT, PAPIEvents, 1))[0];

  double InitCost;
  if (Randomness)
    InitCost = (rand() % 10) + 1;
  else
    InitCost = GEOS::analyseCost(PModule, Opts);

  int Cycles = 0;
  CompareSolution CompSolVar(EstimatedAccuracy);

  BestSeqT BestSequences((CompareSolution(EstimatedAccuracy)));
  BestSeqT GlobalBest((CompareSolution(EstimatedAccuracy)));
  PopT Population;


  initializePopulation(Population);
  evaluatePopulation(Population, CorrectionBase, OptAccuracyBase,
      BestSequences, PModule, Opts, EstimatedAccuracy);

  time_t Start = time(0);
  while (!isFinished(Start, Cycles)) {
    PopT MatingPool = 
      selection(Population, EstimatedAccuracy);
    Population = 
      crossover(MatingPool);
    mutation(Population);

    evaluatePopulation(Population, CorrectionBase, OptAccuracyBase,
        BestSequences, PModule, Opts, EstimatedAccuracy);

    BestSeqT Aux((CompareSolution(EstimatedAccuracy)));
    for (unsigned i = 0; i < BSIZE; i++) {
      Aux.push(BestSequences.top());
      BestSequences.pop();
      if (GlobalBest.size()) {
        Aux.push(GlobalBest.top());
        GlobalBest.pop();
      }
    }
    GlobalBest = BestSeqT(CompareSolution(EstimatedAccuracy));
    for (unsigned i = 0; i < BSIZE; i++) {
      GlobalBest.push(Aux.top());
      Aux.pop();
    }
    Cycles += 1;
  }

  double BestRealSpeedUp = 0;
  double BestEstSpeedUp = 0;
  Solution BestSolution;
  while (GlobalBest.size() != 0) {
    auto B = GlobalBest.top();
    auto PO = GEOS::applyPasses(PModule, B.Sequence);
    double RealFinalCost = 
      (GEOS::getPAPIProfile(PO, ExecutionKind::JIT, PAPIEvents, 1))[0];
    double FinalCost;

    if (Randomness) FinalCost = (rand() % 10) + 1;
    else FinalCost = GEOS::analyseCost(PO, Opts);


    if ((RealInitCost/RealFinalCost) > BestRealSpeedUp) {
      BestRealSpeedUp = RealInitCost/RealFinalCost;
      BestEstSpeedUp = InitCost/FinalCost;
      BestSolution = B;
    }

    if (Randomness) GlobalBest = BestSeqT();
    else GlobalBest.pop();
  }

  printf("\n%f %f\n", BestEstSpeedUp,
      BestRealSpeedUp);
  return 0;
}
