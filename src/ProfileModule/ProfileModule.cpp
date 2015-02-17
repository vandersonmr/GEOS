//===-- ProfileModule.cpp -  The Profile Module -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the Profile Module. Which
/// encapsulate a LLVMModule and also the profiling information of this module. 
///
//===----------------------------------------------------------------------===//

#include "ProfileModule/ProfileModule.h"

#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/CFG.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/Support/FileSystem.h"

#include <stack>

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

bool ProfileModule::hasBasicBlockFrequency(const BasicBlock &BB) const {
  return hasWeight(*BB.getTerminator());
}

uint64_t ProfileModule::getBasicBlockFrequency(const BasicBlock &BB) const {
  if (hasBasicBlockFrequency(BB))
    return getWeight(*BB.getTerminator());
  else return 0;
}

void 
ProfileModule::setBasicBlockFrequency(BasicBlock &BB, uint64_t Freq) {
  setWeight(*BB.getTerminator(), Freq);
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

        } else {

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
        }
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

      } else {

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
      }

    }
  }


  return SuccessorsWeight;
}


void ProfileModule::repairFunctionProfiling(Function *Func) {
  bool changed = true;
  while(changed) {
    changed = false;
    for (auto &BB : *Func) {
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

void ProfileModule::repairProfiling() {
  for (auto &Func : *LLVMModule) {
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
    new raw_fd_ostream(Path, Err, llvm::sys::fs::OpenFlags::F_Excl);
  WriteBitcodeToFile(getLLVMModule(), *Out);                         
  Out->flush();
  delete Out;
}           
