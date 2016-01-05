//===------- include/ProfileModule.h - The Profile Module  -*- C++ -*------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of the Profile Module, which
/// encapsulate a LLVMModule with profiling information. 
///
//===----------------------------------------------------------------------===//
#ifndef PROFILEMODULE_H
#define PROFILEMODULE_H

#include "llvm/IR/Module.h"
#include "llvm/Support/GCOV.h"

#include "geos/ProfileModule/PassSequence.h"
#include "geos/ProfileModule/ModuleMetric.h"

#include <vector>
#include <unordered_map>

/// \brief This class is responsible for encapsulating profile information with
/// LLVM code, make copies of itself, and maintain the consistency of itself.
class ProfileModule {
  private:
    PassSequence Passes;
    llvm::Module *LLVMModule;

    /// \brief This function uses the predecessors of the given basic block to 
    /// estimate and update its execution frequency. 
    uint64_t getExecutionFreqUsingPredecessors(llvm::BasicBlock *BB);

    /// \brief This function uses the predecessors of the given basic block to 
    /// estimate and update its execution frequency. 
    uint64_t getExecutionFreqUsingSuccessors(llvm::BasicBlock *BB);
  public:
    std::unordered_map<std::string, uint64_t> BBFreq;

    /// \brief If this class has been optimized this function will return the
    /// optimizations used.
    PassSequence getPasses() {
      return Passes;
    }

    /// \brief Don't use this function. It is supposed to be used by the profile
    /// module.
    void setPasses(PassSequence P) {
      Passes = P;
    }

    /// \brief For each basic block in the CFG of the given function, its 
    /// predecessors and successors are used to estimate and update its 
    /// execution frequency.
    void repairFunctionProfiling(llvm::Function*);

    /// \brief Repair each function in the module.
    void repairProfiling();

    /// \brief Propagates the frequency stored in each instruction to its 
    /// basic block (if it doesn't already have a frequency).
    void propagateInstToBasicBlock();
    
    /// \brief Return true if the execution frequency of the given instruction
    /// is known, otherwise returns false.
    bool hasInstructionFrequency(const llvm::Instruction&) const;

    /// \brief Returns the execution frequency of the given instruction, but if 
    /// it doesn't have the frequency, it will return 0.
    uint64_t getInstructionFrequency(const llvm::Instruction&) const; 

    /// \brief Sets the execution frequency of a instruction.
    void setInstructionFrequency(llvm::Instruction&, uint64_t); 

    /// \brief Return true if the execution frequency of the given basic block
    /// is known, otherwise returns false.
    bool hasBasicBlockFrequency(const llvm::BasicBlock&) const;

    /// \brief Returns the execution frequency of the given basic block, but if 
    /// it doesn't have the frequency, it will return 0.
    uint64_t getBasicBlockFrequency(const llvm::BasicBlock&) const; 

    /// \brief Sets the execution frequency of a basic block.
    void setBasicBlockFrequency(llvm::BasicBlock&, uint64_t); 

    /// \brief If the basic block ends with a branch as terminator instruction
    /// and the frequencies of this branch are known, it will return true. 
    /// Otherwise, it will return false.
    bool hasBranchFrequency(const llvm::BasicBlock&) const;

    /// \brief Returns a vector with the execution frequency for each possible 
    /// path that can be taken by the terminator instruction of a given 
    /// basicblock. If it doesn't have the frequency it will return 0.
    std::vector<uint32_t> getBranchFrequency(const llvm::BasicBlock&) const; 

    /// \brief Sets the execution frequency for each path that can be taken
    /// by the terminator instruction of the given basicblock.
    void setBranchFrequency(llvm::BasicBlock&, std::vector<uint32_t>&); 

    /// \brief Returns true if the instruction have an ID, otherwise 
    /// returns false.
    bool hasID(const llvm::Instruction &I) const;

    /// \brief Returns the ID of a given instruction.
    int  getID(const llvm::Instruction &I);

    /// \brief Returns true if the call instruction have a cost, otherwise 
    /// returns false.
    bool hasCallCost(const llvm::CallInst&) const;

    /// \brief Returns the call cost of a given call instruction.
    double getCallCost(const llvm::CallInst&) const; 

    /// \brief Sets the cost of a given call instruction.
    void setCallCost(llvm::CallInst&, double); 

    ProfileModule(llvm::Module*);

    /// \brief Returns its LLVM Module.
    llvm::Module* getLLVMModule() const;

    /// \brief Make a copy of the Profiling Module.
    ProfileModule* getCopy() const;

    /// \brief It saves the LLVM module with all the profiling information
    /// in the given path.
    void print(const std::string) const;

    /// \brief Generates metrics for the ProfileModule allowing comparasion 
    /// between two ProfileModules.
    ModuleMetric getMetrics(); 
};

#endif
