//===------------ BBDescriptor.cpp - Basic Block Hash -*- C++ -*-----------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of a Basic Block Hash 
/// representation in memory. Which is responsable for creating, loading and 
/// comparing BB's Hashs. 
///
//===----------------------------------------------------------------------===//

#include "BBDescriptor.h"

#include <vector>

using namespace llvm;

void BBDescriptor::loadBB(BasicBlock &BB) {
  int BBSize = BB.getInstList().size();

  set(Descriptor::NumberOfInstructions, BBSize);

  for (auto &i : BB) {
    addUp(Descriptor::NumberOfInstructions);
    switch (i.getOpcode()) {
      case Instruction::GetElementPtr:
        addUp(Descriptor::GetElementPtr);
        break;
      case Instruction::Ret:
        addUp(Descriptor::Ret);
        break;
      case Instruction::PHI:
        addUp(Descriptor::Phi);
        break;
      case Instruction::Br: 
        addUp(Descriptor::Br);
        break;
      case Instruction::FRem:
        addUp(Descriptor::FRem);
        break;
      case Instruction::FAdd:
        addUp(Descriptor::FAdd);
        break;
      case Instruction::FSub:
        addUp(Descriptor::FSub);
        break;
      case Instruction::FMul:
        addUp(Descriptor::FMul);
        break;
      case Instruction::FDiv: 
        addUp(Descriptor::FDiv);
        break;
      case Instruction::Add:
        addUp(Descriptor::Add);
        break;
      case Instruction::Sub:
        addUp(Descriptor::Sub);
        break;
      case Instruction::Mul:
        addUp(Descriptor::Mul);
        break;
      case Instruction::UDiv:
        addUp(Descriptor::UDiv);
        break;
      case Instruction::SDiv:
        addUp(Descriptor::SDiv);
        break;
      case Instruction::URem:
        addUp(Descriptor::URem);
        break;
      case Instruction::SRem:
        addUp(Descriptor::SRem);
        break;
      case Instruction::Shl:
        addUp(Descriptor::Shl);
        break;
      case Instruction::LShr:
        addUp(Descriptor::LShr);
        break;
      case Instruction::AShr:
        addUp(Descriptor::AShr);
        break;
      case Instruction::And:
        addUp(Descriptor::And);
        break;
      case Instruction::Or:
        addUp(Descriptor::Or);
        break;
      case Instruction::Xor: 
        addUp(Descriptor::Xor);
        break;
      case Instruction::ICmp:
        addUp(Descriptor::ICmp);
        break;
      case Instruction::FCmp: 
        addUp(Descriptor::FCmp);
        break;
      case Instruction::Store: 
        addUp(Descriptor::Store);
        break;
      case Instruction::Load: 
        addUp(Descriptor::Load);
        break;
      case Instruction::ExtractElement: 
        addUp(Descriptor::ExtractElement);
        break;
      case Instruction::InsertElement: 
        addUp(Descriptor::InsertElement);
        break;
      case Instruction::ShuffleVector: 
        addUp(Descriptor::ShuffleVector);
        break;
      case Instruction::Call:  
        addUp(Descriptor::Calls);
        auto Func = cast<CallInst>(i).getCalledFunction();
        if (Func != nullptr) {
          auto FuncName = Func->getName(); 
          if (FuncName == "printf") {
            addUp(Descriptor::Printf);  
          } else if (FuncName == "malloc") {
            addUp(Descriptor::Malloc);
          } else if (FuncName == "pow") {
            addUp(Descriptor::Pow);
          } else if (FuncName == "sqrt") {
            addUp(Descriptor::Sqrt);
          }
        }
        break;
    }
  }
}

BBDescriptor::BBDescriptor() {
  Descriptions.resize(Size);
  for (int i=0; i < Size; i++) 
    Descriptions[i] = 0;
}

BBDescriptor::BBDescriptor(BasicBlock &BB) {
  Descriptions.resize(Size);
  loadBB(BB);
}

BBDescriptor::BBDescriptor(const StringRef &S) {
  Descriptions.resize(Size);

  std::stringstream ss(S.str());
  int d;
  char p;
  for (int i = 0; i < Size; i++) {
    ss >> d;
    Descriptions[i] = d;
    ss >> p;
  }
}

void BBDescriptor::set(Descriptor DescriptionId, int Value) {
  Descriptions[DescriptionId] = Value;
}

void BBDescriptor::addUp(Descriptor DescriptionId, int N) { 
  Descriptions[DescriptionId] += N;  
}

int BBDescriptor::getDescription(Descriptor DescriptionId) {
  return Descriptions[DescriptionId];
}

StringRef BBDescriptor::getString() {
  std::stringstream SSTM;
  for (int i=0; i < Size-1; i++) 
    SSTM << Descriptions[i] << "-";
  SSTM << Descriptions[Size-1];
  return SSTM.str();
}

double BBDescriptor::
distance(BBDescriptor &a, BBDescriptor &b, bool Weight) {
  double Distance = 0;
  for (int i=0; i < Size; i++) 
    Distance += pow(a.getDescription((Descriptor) i) - 
        b.getDescription((Descriptor) i), 2) 
      * (Weight ? descriptorWeight((Descriptor) i) : 1);

  return sqrt(Distance);
}

unsigned BBDescriptor::descriptorWeight(Descriptor d) {
  switch (d) {
    case Descriptor::Load:
    case Descriptor::Store:
    case Descriptor::FRem:
    case Descriptor::FAdd:
    case Descriptor::FSub:
    case Descriptor::FMul:
    case Descriptor::FDiv:
      return 2;
    case Descriptor::Calls: 
      return 3;
    case Descriptor::Printf:
    case Descriptor::Malloc: 
    case Descriptor::Pow: 
    case Descriptor::Sqrt: 
      return 4;
    default:
      return 1;
  }
}
