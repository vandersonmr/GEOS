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

#include "ProfileModule.h"

#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/CFG.h"

#include <stack>

using namespace llvm;

int I = 0;
ProfileModule::ProfileModule(Module* M, 
    std::list<MemoryBuffer*> GCDA, 
    std::list<MemoryBuffer*> GCNO) {

  LLVMModule = M;

  for (auto &Func : *LLVMModule) {
    for (auto &BB : Func) {
      BB.setName(std::to_string(I));
      I++;
    }
  }

  std::list<MemoryBuffer*>::iterator iGCDA = GCDA.begin();
  std::list<MemoryBuffer*>::iterator iGCNO = GCNO.begin();

  while (iGCDA != GCDA.end() && iGCNO != GCNO.end()) {
    llvm::GCOVFile GF;

    GCOVBuffer GCNO_GB(*iGCNO);
    GCOVBuffer GCDA_GB(*iGCDA);

    std::vector<GCOVFunction*> Profiles = readFunctions(GF, GCNO_GB, GCDA_GB);
    for (auto &FreqFunc : Profiles) {
      Function *LLVMFunc = LLVMModule->getFunction(FreqFunc->getName());
      assert(LLVMFunc != nullptr
          && "Trying to access a LLVM Function that don't exist!");

      auto MBB = FreqFunc->block_begin(); 
      ++MBB;
      ++MBB;
      for(auto &BB : *LLVMFunc) {
        BasicBlockFrequency[BB.getName()] = (*MBB).get()->getCount();
        ++MBB;
      }
    }

    ++iGCDA;
    ++iGCNO;
  }
}

ProfileModule::ProfileModule(Module *M, 
    const std::unordered_map<std::string, uint64_t>& BBFrequnecy) {
  LLVMModule = M;

  for (auto I : BBFrequnecy) 
    BasicBlockFrequency[I.first] = I.second;
}

Module* ProfileModule::getLLVMModule() const {
  return LLVMModule;
}

bool ProfileModule::hasBasicBlockFrequency(const BasicBlock *BB) const {
  assert(BB->hasName() && "Trying to use a BasicBlock without a name.");
  return BasicBlockFrequency.count(BB->getName().str()) > 0;
}

uint64_t ProfileModule::getBasicBlockFrequency(const BasicBlock *BB) const {
  assert(BB->hasName() && "Trying to use a BasicBlock without a name.");
  if (hasBasicBlockFrequency(BB))
    return BasicBlockFrequency.at(BB->getName().str());
  else return 0;
}

void 
ProfileModule::setBasicBlockFrequency(const BasicBlock *BB, uint64_t Freq) {
  assert(BB->hasName() && "Trying to use a BasicBlock without a name.");
  BasicBlockFrequency[BB->getName().str()] = Freq;
}

uint64_t 
ProfileModule::getExecutionFreqUsingPredecessors(BasicBlock* BB) {
  uint64_t PredecessorsWeight = 0;
  for (auto IT = pred_begin(BB), ET = pred_end(BB); IT != ET; ++IT) {
    BasicBlock* Predecessor = *IT;
    auto Terminator = Predecessor->getTerminator();

    if (BB != Predecessor) { 
      if (isa<BranchInst>(Terminator)) {
        if (cast<BranchInst>(Terminator)->isUnconditional()) {

          PredecessorsWeight += getBasicBlockFrequency(Predecessor);

        } else {

          uint64_t EdgeWeight = getBasicBlockFrequency(Predecessor);
          for (unsigned J = 0; J < Terminator->getNumSuccessors(); ++J) {
            auto SuccPred = Terminator->getSuccessor(J);
            if (SuccPred != BB) {
              if (!hasBasicBlockFrequency(SuccPred) || 
                  SuccPred->getUniquePredecessor() == nullptr ||
                  EdgeWeight < getBasicBlockFrequency(SuccPred)) {
                EdgeWeight = 0;
                break;
              } else {
                EdgeWeight -= getBasicBlockFrequency(SuccPred);
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
ProfileModule::getExecutionFreqUsingSuccessors(BasicBlock* BB) {
  uint64_t SuccessorsWeight = 0;
  auto Terminator = BB->getTerminator();
  for (unsigned E = 0; E < Terminator->getNumSuccessors(); ++E) {
    BasicBlock* Successor = Terminator->getSuccessor(E);

    if (BB != Successor) { 
      if (Successor->getSinglePredecessor() == BB) {

        SuccessorsWeight += getBasicBlockFrequency(Successor);

      } else {

        uint64_t EdgeWeight = getBasicBlockFrequency(Successor);
        for (auto IT = pred_begin(Successor); IT != pred_end(Successor); ++IT) {
          BasicBlock* PredSucc = *IT;

          if (PredSucc != BB) {
            auto PredSuccTerminator = PredSucc->getTerminator();

            if (isa<BranchInst>(PredSuccTerminator) &&
                cast<BranchInst>(PredSuccTerminator)->isUnconditional() &&
                hasBasicBlockFrequency(PredSucc) && 
                EdgeWeight >= getBasicBlockFrequency(PredSucc)) {

              EdgeWeight -= getBasicBlockFrequency(PredSucc);
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
      if (!BB.hasName()) 
        BB.setName(std::to_string(++I));

      uint64_t PredecessorsWeight = getExecutionFreqUsingPredecessors(&BB);
      uint64_t SuccessorsWeight   = getExecutionFreqUsingSuccessors(&BB);

      uint64_t ExecutionFreq = std::max(PredecessorsWeight, SuccessorsWeight);

      if (ExecutionFreq > getBasicBlockFrequency(&BB) &&
          ExecutionFreq != 0) { 
        setBasicBlockFrequency(&BB, ExecutionFreq);
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
  return new ProfileModule(NewModule, BasicBlockFrequency); 
}

std::vector<GCOVFunction*>
ProfileModule::readFunctions(GCOVFile& GF, GCOVBuffer &GCNOBuffer, 
    GCOVBuffer &GCDABuffer) {

  GCOV::GCOVVersion Version;
  std::vector<GCOVFunction*> *Functions = 
    new std::vector<GCOVFunction*>; 

  uint32_t Checksum;

  GCOVOptions Options(true, true, true, true, true, true, false, false);
  FileInfo FI(Options);

  if (!GCNOBuffer.readGCNOFormat() || !GCDABuffer.readGCDAFormat()) 
    return *Functions;
  if (!GCNOBuffer.readGCOVVersion(Version) || 
      !GCDABuffer.readGCOVVersion(Version)) 
    return *Functions;

  if (!GCNOBuffer.readInt(Checksum) || !GCDABuffer.readInt(Checksum)) 
    return *Functions;

  while (true) {
    if (!GCNOBuffer.readFunctionTag()) break;
    if (!GCDABuffer.readFunctionTag()) break; 
    auto GFun = new GCOVFunction(GF);
    if (!GFun->readGCNO(GCNOBuffer, Version) ||
        !GFun->readGCDA(GCDABuffer, Version))
      return *Functions;

    GFun->collectLineCounts(FI);

    Functions->push_back(GFun);
  }

  FI.setRunCount(1);
  FI.setProgramCount(1);

  return *Functions;
}
