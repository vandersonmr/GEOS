//===------- include/ProfileModule.h - The Profile Module  -*- C++ -*------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of the Profile Module. Which
/// encapsulate a LLVMModule with profiling information. 
///
//===----------------------------------------------------------------------===//
#ifndef PROFILEMODULE_H
#define PROFILEMODULE_H

#include "llvm/IR/Module.h"

#include "llvm/Support/GCOV.h"

#include <vector>

/// \brief This class is responsable for encapsulating, copying, and mantaing 
/// the consistency of its LLVM Module and its profiling information.
class ProfileModule {
  private:
    llvm::Module *LLVMModule;

    /// \brief Uses the predecessors of a Basic Block to estimate and update its 
    ///  execution frequency. 
    uint64_t getExecutionFreqUsingPredecessors(llvm::BasicBlock *BB);

    /// \brief Uses the predecessors of a Basic Block to estimate and update its 
    ///  execution frequency. 
    uint64_t getExecutionFreqUsingSuccessors(llvm::BasicBlock *BB);
  public:
    /// \brief For each Basic Block in the CFG its predecessors and successors 
    /// are used to estimate and update its execution frequency.
    void repairFunctionProfiling(llvm::Function*);

    /// \brief Repair each function in the module.
    void repairProfiling();

    /// \brief returns true if the execution frequency of the given basicblock
    /// is known, otherwise returns false.
    bool hasBasicBlockFrequency(const llvm::BasicBlock&) const;

    /// \brief returns the execution frequency of the given basicblock, and if 
    /// it doesn't have the frequency it will return 0.
    uint64_t getBasicBlockFrequency(const llvm::BasicBlock&) const; 

    /// \brief sets the execution frequency of an given basic block.
    void setBasicBlockFrequency(llvm::BasicBlock&, uint64_t); 

    /// \brief returns true if the execution frequency of the terminator of an 
    /// given basicblock is known, otherwise returns false.
    bool hasBranchFrequency(const llvm::BasicBlock&) const;

    /// \brief returns a vector with the execution frequency for each possible 
    /// path that can be taken by the terminator instruction of a given 
    /// basicblock. If it doesn't have the frequency it will return 0.
    std::vector<uint32_t> getBranchFrequency(const llvm::BasicBlock&) const; 

    /// \brief sets the execution frequency for each path that can be taken
    /// by the terminator instruction of the given basicblock.
    void setBranchFrequency(llvm::BasicBlock&, std::vector<uint32_t>&); 

    /// \brief returns true if the instruction have an ID, otherwise 
    /// returns false.
    bool hasID(const llvm::Instruction &I) const;

    /// \brief Returns the ID of a given instruction.
    int  getID(const llvm::Instruction &I);

    /// \brief returns true if the call instruction have a cost, otherwise 
    /// returns false.
    bool hasCallCost(const llvm::CallInst&) const;

    /// \brief Returns the call's cost of a given call.
    double getCallCost(const llvm::CallInst&) const; 

    /// \brief Sets the cost of a given call.
    void setCallCost(llvm::CallInst&, double); 

    ProfileModule(llvm::Module*);

    /// \brief Returns its LLVM Module.
    llvm::Module* getLLVMModule() const;

    /// \brief Returns a copy of the Profiling Module.
    ProfileModule* getCopy() const;

    /// \brief It saves the LLVM module with all the profiling information
    /// in the given path.
    void print(const std::string) const;
};

#endif
