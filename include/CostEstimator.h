//===-- include/CostEstimator.h - llvm::Instruction Cost Estimator  -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations and implementation of 
/// a LLVM llvm::Instruction Cost Estimator. From an LLVM instruction it gives a cost
/// based in its execution time. 
///
//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Value.h"

namespace {
  class CostEstimator {
    public:
      static unsigned getInstructionCost(const llvm::Instruction *I);
  };

  enum Cost {
    High   = 4,
    Medium = 2,
    Low    = 1,
    None   = 0
  };

  unsigned CostEstimator::getInstructionCost(const llvm::Instruction *I) {
    switch (I->getOpcode()) {
      case llvm::Instruction::GetElementPtr:
        return Cost::Low;
      case llvm::Instruction::Ret:
      case llvm::Instruction::PHI:
      case llvm::Instruction::Br: 
        return Cost::None;
      case llvm::Instruction::FRem:
      case llvm::Instruction::FAdd:
      case llvm::Instruction::FSub:
      case llvm::Instruction::FMul:
      case llvm::Instruction::FDiv: 
        return Cost::Medium;
      case llvm::Instruction::Add:
      case llvm::Instruction::Sub:
      case llvm::Instruction::Mul:
      case llvm::Instruction::UDiv:
      case llvm::Instruction::SDiv:
      case llvm::Instruction::URem:
      case llvm::Instruction::SRem:
      case llvm::Instruction::Shl:
      case llvm::Instruction::LShr:
      case llvm::Instruction::AShr:
      case llvm::Instruction::And:
      case llvm::Instruction::Or:
      case llvm::Instruction::Xor: 
        return Cost::Low;
      case llvm::Instruction::Select: 
        return Cost::Low;
      case llvm::Instruction::ICmp:
      case llvm::Instruction::FCmp: 
        return Cost::Low;
      case llvm::Instruction::Store: 
        return Cost::Low;
      case llvm::Instruction::Load: 
        return Cost::Low;
      case llvm::Instruction::ZExt:
      case llvm::Instruction::SExt:
      case llvm::Instruction::FPToUI:
      case llvm::Instruction::FPToSI:
      case llvm::Instruction::FPExt:
      case llvm::Instruction::PtrToInt:
      case llvm::Instruction::IntToPtr:
      case llvm::Instruction::SIToFP:
      case llvm::Instruction::UIToFP:
      case llvm::Instruction::Trunc:
      case llvm::Instruction::FPTrunc:
      case llvm::Instruction::BitCast:
      case llvm::Instruction::AddrSpaceCast: 
        return Cost::None;
      case llvm::Instruction::ExtractElement: 
        return Cost::Low;
      case llvm::Instruction::InsertElement: 
        return Cost::Low;
      case llvm::Instruction::ShuffleVector: 
        return Cost::Low;
      case llvm::Instruction::Call:  
        return Cost::Low;
      default:
        return Cost::Low;
    }
  }
}
