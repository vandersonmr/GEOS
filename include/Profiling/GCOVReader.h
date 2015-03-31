//===------------- include/GCOVReader.h - Load GCOV Profile ---------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains declarations of GCOV Profile Loader. 
//
//===----------------------------------------------------------------------===//

#include "llvm/Support/MemoryBuffer.h"

#include "ProfileModule/ProfileModule.h"
#include "Profiling/GCOV.h"

#include <vector>

/// \brief It loads in the ProfileModule branch frequency information from GCOVs 
/// files.
void loadGCOV(std::vector<llvm::MemoryBuffer*>, 
    std::vector<llvm::MemoryBuffer*>, ProfileModule*);

