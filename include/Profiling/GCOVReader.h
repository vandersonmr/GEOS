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

#include "ProfileModule/ProfileModule.h"
#include "Profiling/GCOV.h"

#include "llvm/Support/MemoryBuffer.h"

#include <vector>

void loadGCOV(std::vector<llvm::MemoryBuffer*>, 
    std::vector<llvm::MemoryBuffer*>, ProfileModule*);

