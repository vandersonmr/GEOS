//===--------- CacheAnalysis.cpp - Cache Cost Estimator -*- C++ -*---------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of the instruction
/// cache analysis and also use of registers analysis.
//
// !TODO
//  * More acurate inst weight
//  * Reduce cache size for L1
//  * Follow more the algorithm
//===----------------------------------------------------------------------===//

#include "CostEstimator/CostAnalysis.h"

#include "llvm/CodeGen/MachineFunctionAnalysis.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachinePostDominators.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetSubtargetInfo.h"

#include <unordered_map>

#include "CostEstimator/InstructionCostEstimator.h"
#include "CostEstimator/LRUCache.h"

using namespace llvm;

class CacheSet {
  unsigned Size;
  unsigned LineSize;

  unsigned getLineStart(unsigned Addr) {
    return ((unsigned) (Addr / LineSize)) * LineSize;
  }
  public:
  lru::list<unsigned> Cache;

  CacheSet(unsigned W, unsigned L) : Size(W), LineSize(L) {
    Cache.resize(W);
  };

  void cache(unsigned Addr) { // TODO Change to LRU
     Cache.insert(Addr);
  }

  bool isCached(unsigned Addr) {
    return Cache.find(Addr) != Cache.end();
  }
};

typedef std::unordered_map<MachineInstr*, unsigned> AddressMap;

struct AbstractCacheState {
  std::vector<CacheSet> Sets;
  unsigned L, W; 
  AbstractCacheState(unsigned S, unsigned W, unsigned L) : L(L), W(W) {
    for (unsigned i = 0; i < S; i++)
      Sets.push_back(CacheSet(W, L));
  }

  bool isCached(unsigned Addr) {
    return Sets[(Addr / L) % W].isCached(Addr);
  }

  void cache(unsigned Addr) {
    Sets[(Addr / L) % W].cache(Addr);
  }
};

// More acurate inst weight
// reduce cache size for L1
// Follow more the algorithm

struct MachineAST : public FunctionPass {
  static char ID;

  const unsigned S = 64;
  const unsigned W = 8;
  const unsigned L = 64; 

  const ProfileModule *Profile;
  const TargetMachine &TM;
  MachineAST(const ProfileModule *P, const TargetMachine &tm) : 
    FunctionPass(ID), Profile(P), TM(tm) {
  };

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<MachineFunctionAnalysis>();
  }

  bool First = true;
  double getFunctionCost(Function &F) {
    if (FuncToMachine[F.getName().str()] != 0 && 
        !MFCost.count(F.getName().str())) {

      if (First) {
        auto ACS = new AbstractCacheState(S, W, L);
        calculateFuncInstanceCost(ACS, *FuncToMachine["main"]);
        First = false;
      }

      if (Visited.count(F.getName().str()) == 0) {
        if (FuncToMachine[F.getName().str()] != nullptr) {
          auto ACS = new AbstractCacheState(S, W, L);
          calculateFuncInstanceCost(ACS, *FuncToMachine[F.getName().str()]);
        }
      }
    }

    return MFCost[F.getName().str()];
  }

  unsigned getEncodedSize(MachineInstr &MI) { 
    auto Desc = MI.getDesc();
    if (Desc.getSize() != 0) return Desc.getSize();
    else {
      switch (Desc.getOpcode()) {
        case 2: return 0;
        case 2238: return 1;
        case 2115: return 1;
        case 2382: return 1;
        default : 
          auto Cost = 2;
          for (auto Operand : MI.operands()) 
            if (!Operand.isReg())
              Cost += 2;
          return Cost;
      }
    }
  }

  virtual bool runOnFunction(Function &F) {
    FuncToMachine[F.getName().str()] = 
      &getAnalysis<MachineFunctionAnalysis>().getMF();

    for (auto &MB : *FuncToMachine[F.getName().str()]) {
      for (auto &MI : MB) {
        Address += getEncodedSize(MI);
        Addresses[&MI] = Address;
      }
    }

    return false;
  }

  private:
  unsigned NextFnNum = 0;
  unsigned Address = 0x400780;
  AddressMap Addresses;
  std::unordered_map<MachineBasicBlock*, AbstractCacheState*> Outputs;
  std::unordered_map<std::string, MachineFunction*> FuncToMachine;
  std::unordered_map<std::string, bool> CallTabuList;
  std::unordered_map<std::string, bool> Visited;

  std::unordered_map<std::string, double> MFCost;

  AbstractCacheState* 
    calculateFuncInstanceCost(AbstractCacheState*, MachineFunction&);
};

AbstractCacheState* MachineAST::
calculateFuncInstanceCost(AbstractCacheState* EntryState, MachineFunction &MF) {  
  if (MF.size() == 0) return nullptr; 
  Visited[MF.getName().str()] = true;

  uint64_t Misses = 0;
  int MaxDeep = 10;
  bool modified = true;
  while (modified) {
    if ((--MaxDeep) == 0)
      break;

    modified = false;
    bool First = true;
    for (auto &MB : MF) {
      if (First) {
        Outputs[&MB] = EntryState;
        First = false;
      }

      if (Outputs.count(&MB) == 0) {
        modified = true;
        Outputs[&MB] = new AbstractCacheState(S, W, L);
      }

      MachineBasicBlock *MostFreqMB = nullptr;
      unsigned MostFreqV  = 0;
      for (auto &Pred : MB.predecessors()) {
        if (Outputs.count(Pred) != 0) {
          uint64_t F = Profile->getBasicBlockFrequency(*(MB.getBasicBlock()));
          if (F > MostFreqV) {
            MostFreqV  = F;
            MostFreqMB = Pred;
          }
        }
      }

      if (MostFreqMB != nullptr && Outputs.count(MostFreqMB) != 0) {
        for (unsigned i = 0; i < S; i++) { 
          std::vector<unsigned> Tmp;
          for (auto &Line : Outputs[MostFreqMB]->Sets[i].Cache) 
            Tmp.push_back(Line.first);

          for (auto &Line : Tmp) {
            if (!Outputs[&MB]->isCached(Line)) 
              modified = true;
            Outputs[&MB]->Sets[i].cache(Line);    
          }
        }
      }

      auto I   = MB.getBasicBlock()->begin();   
      for (auto &MI : MB) { 
        if (!Outputs[&MB]->isCached(Addresses[&MI])) {
          modified = true;
          Misses += Profile->getBasicBlockFrequency(*(MB.getBasicBlock()));
        }

        if (MI.isCall()) {
          while (!isa<CallInst>(I)) I++;
          auto CalledFunc = cast<CallInst>(I)->getCalledFunction();
          if (CalledFunc != nullptr) {
            auto CalledMachineFunc = FuncToMachine[CalledFunc->getName().str()];
            if (CalledMachineFunc != nullptr) {
              auto CallName = CalledFunc->getName() + MF.getName();
              if (CallTabuList.count(CallName.str()) == 0) {
                CallTabuList[CallName.str()] = true;
                calculateFuncInstanceCost(Outputs[&MB], *CalledMachineFunc);
              }   
            }
          }
        }

        Outputs[&MB]->cache(Addresses[&MI]);
      }

    }
  }

  MFCost[MF.getName().str()] += Misses * 0.1;  
  return Outputs[&MF.back()];
}

char MachineAST::ID = 0;

MachineAST *MAST = nullptr;
void compileModule(Module *M, const ProfileModule *Profile, PassManager &PM) {
  Triple TheTriple;

  std::string TargetTriple;
  StringRef MCPU = sys::getHostCPUName();

  M->setTargetTriple(Triple::normalize(TargetTriple));
  TheTriple = Triple(M->getTargetTriple());

  if (TheTriple.getTriple().empty())
    TheTriple.setTriple(sys::getDefaultTargetTriple());

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", TheTriple, Error);

  if (!TheTarget) {
    errs() << ": " << Error;
    return;
  }

  std::string FeaturesStr;
  CodeGenOpt::Level OLvl = CodeGenOpt::None;

  TargetOptions Options;

  //std::unique_ptr<TargetMachine> Target(
  TargetMachine* Target = TheTarget->createTargetMachine(TheTriple.getTriple(), MCPU, FeaturesStr,
      Options, Reloc::Model::Default, 
      CodeModel::Model::Default,
      OLvl);
  assert(Target && "Could not allocate target machine!");

  TargetLibraryInfo *TLI = new TargetLibraryInfo(TheTriple);
  PM.add(TLI);

  if (const DataLayout *DL = Target->getSubtargetImpl()->getDataLayout())
    M->setDataLayout(DL);
  PM.add(new DataLayoutPass());

  std::error_code Err;
  raw_fd_ostream *Out =          
    new raw_fd_ostream("/dev/null", Err, llvm::sys::fs::OpenFlags::F_None);
  formatted_raw_ostream FOS(*Out);

  Target->addPassesToEmitFile(PM, FOS, 
      TargetMachine::CodeGenFileType::CGFT_Null, false, 
      nullptr, nullptr);

  MAST = new MachineAST(Profile, *Target);  

  PM.add(MAST);
  PM.run(*M);
  MAST->getFunctionCost(*(M->getFunction("main")));
}

PassManager *PM;
InstructionCacheAnalysis::InstructionCacheAnalysis(const ProfileModule* P) {
  PM = new PassManager;
  PModule = P;
  Module *M = P->getLLVMModule();
  compileModule(M, P, *PM);
}

InstructionCacheAnalysis::~InstructionCacheAnalysis() {
  delete PM;
  delete MAST;
}

double InstructionCacheAnalysis::estimateCost(StringRef FuncName, 
    const ProfileModule *Profile, CostEstimatorOptions Opts) const {

  Module *M = PModule->getLLVMModule();
  return MAST->getFunctionCost(*(M->getFunction(FuncName))) * 0.25;
}
