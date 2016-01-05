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

#include "geos/ProfileModule/ProfileModule.h"
#include "llvm/Support/GCOV.h"

#include <vector>

/// \brief This function loads GCOV files and add the profiling information of
/// them in the ProfileModule given as paramter.
void loadGCOV(std::vector<llvm::MemoryBuffer*>, 
    std::vector<llvm::MemoryBuffer*>, ProfileModule*);

