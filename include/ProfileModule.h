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

#include "llvm/IR/Module.h"
#include "llvm/Support/GCOV.h"

#include <unordered_map>
#include <list>
#include <vector>

/// \brief This class is responsable for encapsulating, copying, and mantaing 
/// consistency of a LLVM Module and its profiling information.
class ProfileModule {
  private:
    /// \brief The LLVM Module.
    llvm::Module *LLVMModule;

    /// \brief The Profiling information of each function.
    std::vector<llvm::GCOVFunction*> Profiles;

    /// \brief 
    std::unordered_map<std::string, llvm::GCOVFunction*> ProfilesByName;

    /// \brief This function loads from files (GCDA and GCNO) the GCOV profiling
    /// information.
    std::vector<llvm::GCOVFunction*>
    readFunctions(
        llvm::GCOVFile& GF, llvm::GCOVBuffer &GCNOBuffer, 
        llvm::GCOVBuffer &GCDABuffer); 
    
    /// \brief List of buffers of each GCNO file that contains the profiling
    /// information. Those buffers are used by the getCopy function to create 
    /// a new profiling information. 
    std::list<llvm::MemoryBuffer*> LGCNO;

    /// \brief List of buffers of each GCDA file that contains the profiling
    /// information. Those buffers are used by the getCopy function to create 
    /// a new profiling information. 
    std::list<llvm::MemoryBuffer*> LGCDA;

  public:
    /// \brief The constructor needs a LLVM Module and two lists of buffers of
    /// GCOV files to create the profiling information. 
    ProfileModule(llvm::Module* M, 
                  std::list<llvm::MemoryBuffer*> GCDA, 
                  std::list<llvm::MemoryBuffer*> GCNO);


    /// \brief Returns its LLVM Module.
    llvm::Module* getLLVMModule() const;
    
    /// \brief Returns its profiling information.
    std::vector<llvm::GCOVFunction*> getProfile() const;

    llvm::GCOVFunction* getFunctionProfile(llvm::StringRef) const;

    /// \brief Returns a list of pairs of llvm::function and its execution 
    /// frequency.
    std::vector<std::pair<llvm::Function*, uint64_t>> getFuncsAndFreqs() const;

    /// \brief Returns a copy of the Profiling Module.
    ProfileModule* getCopy() const;
};

