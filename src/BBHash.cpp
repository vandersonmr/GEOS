//===------------ BBHash.cpp - Basic Block Hash -*- C++ -*-----------===//
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

#include "BBHash.h"

#include <vector>

using namespace llvm;

void BBHash::loadBB(BasicBlock &BB) {
  for (int i = 0; i <= Size; i++) 
    Hash[i] = 0;

  int BBSize = BB.getInstList().size();

  setDescriptor(DescriptorKind::NumberOfInstructions, BBSize);

  for (auto &i : BB) {
    switch (i.getOpcode()) {
      case Instruction::GetElementPtr:
        addUpDescriptor(DescriptorKind::GetElementPtr);
        break;
      case Instruction::Ret:
        addUpDescriptor(DescriptorKind::Ret);
        break;
      case Instruction::PHI:
        addUpDescriptor(DescriptorKind::Phi);
        break;
      case Instruction::Br: 
        addUpDescriptor(DescriptorKind::Br);
        break;
      case Instruction::FRem:
        addUpDescriptor(DescriptorKind::FRem);
        break;
      case Instruction::FAdd:
        addUpDescriptor(DescriptorKind::FAdd);
        break;
      case Instruction::FSub:
        addUpDescriptor(DescriptorKind::FSub);
        break;
      case Instruction::FMul:
        addUpDescriptor(DescriptorKind::FMul);
        break;
      case Instruction::FDiv: 
        addUpDescriptor(DescriptorKind::FDiv);
        break;
      case Instruction::Add:
        addUpDescriptor(DescriptorKind::Add);
        break;
      case Instruction::Sub:
        addUpDescriptor(DescriptorKind::Sub);
        break;
      case Instruction::Mul:
        addUpDescriptor(DescriptorKind::Mul);
        break;
      case Instruction::UDiv:
        addUpDescriptor(DescriptorKind::UDiv);
        break;
      case Instruction::SDiv:
        addUpDescriptor(DescriptorKind::SDiv);
        break;
      case Instruction::URem:
        addUpDescriptor(DescriptorKind::URem);
        break;
      case Instruction::SRem:
        addUpDescriptor(DescriptorKind::SRem);
        break;
      case Instruction::Shl:
        addUpDescriptor(DescriptorKind::Shl);
        break;
      case Instruction::LShr:
        addUpDescriptor(DescriptorKind::LShr);
        break;
      case Instruction::AShr:
        addUpDescriptor(DescriptorKind::AShr);
        break;
      case Instruction::And:
        addUpDescriptor(DescriptorKind::And);
        break;
      case Instruction::Or:
        addUpDescriptor(DescriptorKind::Or);
        break;
      case Instruction::Xor: 
        addUpDescriptor(DescriptorKind::Xor);
        break;
      case Instruction::ICmp:
        addUpDescriptor(DescriptorKind::ICmp);
        break;
      case Instruction::FCmp: 
        addUpDescriptor(DescriptorKind::FCmp);
        break;
      case Instruction::Store: 
        addUpDescriptor(DescriptorKind::Store);
        break;
      case Instruction::Load: 
        addUpDescriptor(DescriptorKind::Load);
        break;
      case Instruction::ExtractElement: 
        addUpDescriptor(DescriptorKind::ExtractElement);
        break;
      case Instruction::InsertElement: 
        addUpDescriptor(DescriptorKind::InsertElement);
        break;
      case Instruction::ShuffleVector: 
        addUpDescriptor(DescriptorKind::ShuffleVector);
        break;
      case Instruction::Call:  
        addUpDescriptor(DescriptorKind::Calls);
        auto Func = cast<CallInst>(i).getCalledFunction();
        if (Func != nullptr) {
          auto FuncName = Func->getName(); 
          if (FuncName == "printf") 
            addUpDescriptor(DescriptorKind::Printf);  
          else if (FuncName == "malloc") 
            addUpDescriptor(DescriptorKind::Malloc);
          else if (FuncName == "pow")
            addUpDescriptor(DescriptorKind::Pow);
          else if (FuncName == "sqrt") 
            addUpDescriptor(DescriptorKind::Sqrt);
        }
        break;
    }
  }
}

BBHash::BBHash() {
  Hash.resize(Size);
  for (int i=0; i < Size; i++) 
    Hash[i] = 0;
}

BBHash::BBHash(BasicBlock &BB) {
  Hash.resize(Size);
  loadBB(BB);
}

BBHash::BBHash(const StringRef &S) {
  assert(!S.empty() 
      && "The string representation of a BBHash cannot be empty.");

  Hash.resize(Size);

  std::stringstream ss(S);
  int  d;
  char p;
  for (int i = 0; i < Size; i++) {
    ss >> d;
    setDescriptor((DescriptorKind) i, d);
    ss >> p;

    if (!(d >= 0 && p == '-')) 
      printf("%s\n", S.str().c_str());
    
    assert(d >= 0 && p == '-' 
        && "The string representation of a BBHash is in a bad format.");
  }
}

void BBHash::setDescriptor(DescriptorKind DescriptionId, int Value) {
  assert((int) DescriptionId >= 0 && (int) DescriptionId <= Size &&
      "Trying to set an invalid descriptor.");

  assert(Value >= 0 && 
      "The value of an descriptor must be greater or equal to 0.");

  Hash[DescriptionId] = Value;
}

void BBHash::addUpDescriptor(DescriptorKind DescriptionId, int N) { 
  int NewValue = getDescriptor(DescriptionId) + N;
  setDescriptor(DescriptionId, NewValue);
}

int BBHash::getDescriptor(DescriptorKind DescriptionId) const {
  assert((int) DescriptionId >= 0 && (int) DescriptionId <= Size &&
      "Trying to get the value of an invalid descriptor.");

  return Hash[DescriptionId];
}


StringRef BBHash::getString() const {
  std::stringstream *SSTM = new std::stringstream;
    for (int i=0; i < Size-1; i++) 
      (*SSTM) << getDescriptor((DescriptorKind) i) << "-";
    (*SSTM) << getDescriptor((DescriptorKind) (Size-1)) << "\0\0";
  return SSTM->str();
}

double BBHash::
distance(const BBHash &a, const BBHash &b) {
  double Distance = 0;
  for (int i=0; i < Size; i++) 
    Distance += pow(a.getDescriptor((DescriptorKind) i) - 
        b.getDescriptor((DescriptorKind) i), 2) *
        descriptorWeight((DescriptorKind) i);

  return sqrt(Distance);
}

int BBHash::dotProduct(const BBHash &a, const BBHash &b) {
  int DotProduct = 0;
  for (int i=0; i < Size; i++) 
    DotProduct += a.getDescriptor((DescriptorKind) i) *
        b.getDescriptor((DescriptorKind) i) *
        descriptorWeight((DescriptorKind) i);

  return DotProduct;
}

BBHash* BBHash::getRandomHash() {
  std::random_device Rd;
  std::mt19937 Gen(Rd());
  std::uniform_real_distribution<> Dis(1, 2);

  BBHash* RandomHash = new BBHash;
  
  for(int i = 0; i < Size; i++) 
    RandomHash->setDescriptor((DescriptorKind) i, Dis(Gen));

  return RandomHash;
}

unsigned BBHash::descriptorWeight(DescriptorKind d) {
  switch (d) {
    case DescriptorKind::ExtractElement: 
    case DescriptorKind::InsertElement: 
    case DescriptorKind::ShuffleVector: 
    case DescriptorKind::Load:
    case DescriptorKind::Store:
      return 1;
    case DescriptorKind::FRem:
    case DescriptorKind::FAdd:
    case DescriptorKind::FSub:
    case DescriptorKind::FMul:
    case DescriptorKind::FDiv:
      return 1;
    case DescriptorKind::Calls: 
      return 1000;
    case DescriptorKind::Printf:
    case DescriptorKind::Malloc: 
    case DescriptorKind::Pow: 
    case DescriptorKind::Sqrt: 
      return 50;
    default:
      return 1;
  }
}

