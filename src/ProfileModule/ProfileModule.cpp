//===--------- ProfileModule.cpp -  The Profile Module -*- C++ -*----------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the ProfileModule, which
/// encapsulate a LLVMModule and its profiling information. 
///
//===----------------------------------------------------------------------===//

#include "ProfileModule/ProfileModule.h"

#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/MDBuilder.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <unordered_map>

using namespace llvm;

bool hasWeight(const Instruction &I) {
  return I.getMetadata("Weight") != nullptr;
}

double getWeight(const Instruction &I) {
  assert(hasWeight(I) && 
      "Trying to get the weight of a Instruction without a weight.");

  return std::stod(
      cast<MDString>(I.getMetadata("Weight")->getOperand(0))->getString());
}

void setWeight(Instruction &I, double Weight) {
  LLVMContext& C = I.getContext();
  MDNode* N = 
    MDNode::get(C, MDString::get(C, std::to_string(Weight)));
  I.setMetadata("Weight", N);
}

bool ProfileModule::hasID(const Instruction &I) const {
  return I.getMetadata("ID") != nullptr;
}

int ProfileModule::getID(const Instruction &I) {
  assert(hasID(I) && 
      "Trying to get the ID of an Instruction without an ID.");
  return std::stoi(
      cast<MDString>(I.getMetadata("ID")->getOperand(0))->getString());
}

void setID(Instruction &I, int ID) {
  LLVMContext& C = I.getContext();
  MDNode* N = 
    MDNode::get(C, MDString::get(C, std::to_string(ID)));
  I.setMetadata("ID", N);
}

int nC  = 0; // Counter to generate CallInst's names 
ProfileModule::ProfileModule(Module* M) {
  LLVMModule = M;

  for (auto &Func : *LLVMModule) {
    for (auto &BB : Func) {
      for (auto &I : BB)
        if (isa<CallInst>(I)) 
          if (cast<CallInst>(I).getCalledFunction() == nullptr ||
              cast<CallInst>(I).getCalledFunction()->size() == 0)  
            setID(I, nC++);
    }
  }
}

Module* ProfileModule::getLLVMModule() const {
  return LLVMModule;
}

std::unordered_map<std::string, uint64_t> BBFreq;

bool ProfileModule::hasBranchFrequency(const BasicBlock &BB) const {
  return BB.getTerminator()->getMetadata("prof") != nullptr;
}

void 
ProfileModule::setBranchFrequency(BasicBlock &BB, std::vector<uint32_t> &Freq) {
  MDBuilder MDB(BB.getTerminator()->getContext());
  MDNode *Node = MDB.createBranchWeights(Freq);
  BB.getTerminator()->setMetadata(LLVMContext::MD_prof, Node);
}

std::vector<uint32_t> 
ProfileModule::getBranchFrequency(const BasicBlock &BB) const {
  std::vector<uint32_t> Freqs;
  auto Terminator = BB.getTerminator();
  if (hasBranchFrequency(BB) && Terminator != nullptr) {
    int NumOperands = 
      Terminator->getMetadata("prof")->getNumOperands();
    for (int i = 1; i < NumOperands; i++)  
      Freqs.push_back(cast<ConstantInt>(cast<ConstantAsMetadata>(
              Terminator->getMetadata("prof")->getOperand(i))->getValue())
          ->getSExtValue());
  }
  return Freqs;
}

bool ProfileModule::hasBasicBlockFrequency(const BasicBlock &BB) const {
  return BBFreq.count(BB.getName().str()) != 0;
}

uint64_t ProfileModule::getBasicBlockFrequency(const BasicBlock &BB) const {
  if (hasBasicBlockFrequency(BB)) {
    return BBFreq[BB.getName().str()];
  } else { 
    return 0; 
  } 
}

void 
ProfileModule::setBasicBlockFrequency(BasicBlock &BB, uint64_t Freq) {
  BBFreq[BB.getName().str()] = Freq;
}

bool ProfileModule::hasCallCost(const CallInst &I) const {
  return hasID(I) && hasWeight(I); 
}

double ProfileModule::getCallCost(const CallInst &I) const {
  if (hasCallCost(I))
    return getWeight(I);
  else return 40;
}

void 
ProfileModule::setCallCost(CallInst &I, double Cost) {
  setWeight(I, Cost);
}

uint64_t 
ProfileModule::getExecutionFreqUsingPredecessors(BasicBlock *BB) {
  uint64_t PredecessorsWeight = 0;
  for (auto IT = pred_begin(BB), ET = pred_end(BB); IT != ET; ++IT) {
    BasicBlock* Predecessor = *IT;
    auto Terminator = Predecessor->getTerminator();

    if (BB != Predecessor) { 
      if (isa<BranchInst>(Terminator)) {
        if (cast<BranchInst>(Terminator)->isUnconditional()) {
          PredecessorsWeight += getBasicBlockFrequency(*Predecessor);
        }/* else {
          uint64_t EdgeWeight = getBasicBlockFrequency(*Predecessor);
          for (unsigned J = 0; J < Terminator->getNumSuccessors(); ++J) {
            auto SuccPred = Terminator->getSuccessor(J);
            if (SuccPred != BB) {
              if (!hasBasicBlockFrequency(*SuccPred) || 
                  SuccPred->getUniquePredecessor() == nullptr ||
                  EdgeWeight < getBasicBlockFrequency(*SuccPred)) {
                EdgeWeight = 0;
                break;
              } else {
                EdgeWeight -= getBasicBlockFrequency(*SuccPred);
              }
            }
          }
          PredecessorsWeight += EdgeWeight;
        }*/
      }
    }
  }
  return PredecessorsWeight;
}

uint64_t 
ProfileModule::getExecutionFreqUsingSuccessors(BasicBlock *BB) {
  uint64_t SuccessorsWeight = 0;
  auto Terminator = BB->getTerminator();
  for (unsigned E = 0; E < Terminator->getNumSuccessors(); ++E) {
    BasicBlock* Successor = Terminator->getSuccessor(E);

    if (BB != Successor) { 
      if (Successor->getSinglePredecessor() == BB) {
        SuccessorsWeight += getBasicBlockFrequency(*Successor);
      }/* else {
        uint64_t EdgeWeight = getBasicBlockFrequency(*Successor);
        for (auto IT = pred_begin(Successor); IT != pred_end(Successor); ++IT) {
          BasicBlock* PredSucc = *IT;

          if (PredSucc != BB) {
            auto PredSuccTerminator = PredSucc->getTerminator();

            if (isa<BranchInst>(PredSuccTerminator) &&
                cast<BranchInst>(PredSuccTerminator)->isUnconditional() &&
                hasBasicBlockFrequency(*PredSucc) && 
                EdgeWeight >= getBasicBlockFrequency(*PredSucc)) {

              EdgeWeight -= getBasicBlockFrequency(*PredSucc);
            } else {
              EdgeWeight = 0;
              break;
            }
          }
        }
        SuccessorsWeight += EdgeWeight;
      }*/
    }
  }

  return SuccessorsWeight;
}

struct StaticProfiling : public FunctionPass {
  static char ID;
  ProfileModule *Profile;

  StaticProfiling(ProfileModule *P) : FunctionPass(ID), Profile(P) {};

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<BlockFrequencyInfo>();
    AU.setPreservesAll();
  }

  bool runOnFunction(Function &F) {
    BlockFrequencyInfo &BFI = getAnalysis<BlockFrequencyInfo>();

    for (auto &BB : F) 
      Profile->setBasicBlockFrequency(BB, 
          BFI.getBlockFreq(&BB).getFrequency() / BFI.getEntryFreq());
    return true;
  }
};

void ProfileModule::repairFunctionProfiling(Function *Func) {
  std::unordered_map<BasicBlock*, bool> HasFreq;
  for (auto &BB : *Func)
    if (hasBasicBlockFrequency(BB))
      HasFreq[&BB] = true;

  bool changed = true;
  while(changed) {
    changed = false;
    for (auto &BB : *Func) {
      if (HasFreq.count(&BB) == 0) {
        uint64_t PredecessorsWeight = getExecutionFreqUsingPredecessors(&BB);
        uint64_t SuccessorsWeight   = getExecutionFreqUsingSuccessors(&BB);

        uint64_t ExecutionFreq = std::max(PredecessorsWeight, SuccessorsWeight);

        if (ExecutionFreq > getBasicBlockFrequency(BB) &&
            ExecutionFreq != 0) { 
          setBasicBlockFrequency(BB, ExecutionFreq);
          changed = true;
        }
      }
    }
  }
}

void ProfileModule::repairProfiling() {
  for (auto &Func : *LLVMModule) {
    for (auto &BB : Func) {
      if (hasBranchFrequency(BB)) {
        auto Frequency = 0;
        auto NumSucc = 0;
        for (auto &BFreq : getBranchFrequency(BB)) {
          Frequency += BFreq;
          auto Succ = BB.getTerminator()->getSuccessor(NumSucc);
          if (!hasBasicBlockFrequency(*Succ))
            setBasicBlockFrequency(*Succ, BFreq);
          ++NumSucc;
        }
        setBasicBlockFrequency(BB, Frequency);
      }
    }
    repairFunctionProfiling(&Func);
  }
}

ProfileModule* ProfileModule::getCopy() const {
  Module *NewModule = CloneModule(getLLVMModule());
  return new ProfileModule(NewModule); 
}

void ProfileModule::print(const std::string Path) const {
  std::error_code Err;
  raw_fd_ostream *Out =          
    new raw_fd_ostream(Path, Err, llvm::sys::fs::OpenFlags::F_RW);
  WriteBitcodeToFile(getLLVMModule(), *Out);                         
  Out->flush();
  delete Out;
}           
