//===------- include/ProfileModule.h - The Profile Module  -*- C++ -*------===//
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
#ifndef PROFILEMODULE_H
#define PROFILEMODULE_H

#include "llvm/IR/Module.h"

#include "llvm/Support/GCOV.h"

#include <unordered_map>
#include <vector>

/// \brief This class is responsable for encapsulating, copying, and mantaing 
/// consistency of a LLVM Module and its profiling information.
class ProfileModule {
  private:
    /// \brief The LLVM Module.
    llvm::Module *LLVMModule;

    /// \brief Uses the predecessors of a Basic Block to try to update its 
    ///  execution frequency. 
    uint64_t getExecutionFreqUsingPredecessors(llvm::BasicBlock *BB);

    /// \brief Uses the predecessors of a Basic Block to try to update its 
    ///  execution frequency. 
    uint64_t getExecutionFreqUsingSuccessors(llvm::BasicBlock *BB);
  public:
    /// \brief For each Basic Block in the CFG, the predecessors and successors 
    /// are used to update or find its execution frequency.
    void repairFunctionProfiling(llvm::Function*);

    /// \brief For each function in the ProfileModule it calls
    /// repairFunctionProfiling
    void repairProfiling();

    /// \brief returns true if the execution frequency of the given basicblock
    /// is known, otherwise returns false.
    bool hasBasicBlockFrequency(const llvm::BasicBlock&) const;

    /// \brief returns the execution frequency of the given basicblock, if it
    /// doesn't have the frequency it will return 0.
    uint64_t getBasicBlockFrequency(const llvm::BasicBlock&) const; 

    /// \brief sets the execution frequency of an given basic block.
    void setBasicBlockFrequency(llvm::BasicBlock&, uint64_t); 

    bool hasBranchFrequency(const llvm::BasicBlock&) const;
    std::vector<uint32_t> getBranchFrequency(const llvm::BasicBlock&) const; 
    void setBranchFrequency(llvm::BasicBlock&, std::vector<uint32_t>&); 

    bool hasID(const llvm::Instruction &I) const;
    int  getID(const llvm::Instruction &I);

    /// \brief returns true if the execution frequency of the given basicblock
    /// is known, otherwise returns false.
    bool hasCallCost(const llvm::CallInst&) const;

    /// \brief Returns the execution frequency of the given BasicBlock, if it
    /// doesn't have the frequency it will return 0.
    double getCallCost(const llvm::CallInst&) const; 

    /// \brief Sets the execution frequency of an given basic block.
    void setCallCost(llvm::CallInst&, double); 

    /// \brief The constructor needs a LLVM Module and two lists of buffers of
    /// GCOV files to create the profiling information. 
    ProfileModule(llvm::Module*);

    /// \brief Returns its LLVM Module.
    llvm::Module* getLLVMModule() const;

    /// \brief Returns a copy of the Profiling Module.
    ProfileModule* getCopy() const;

    void print(const std::string) const;
};

#endif
