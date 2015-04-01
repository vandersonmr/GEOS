//===---------------- CallCostReader.h - Load Call's Cost ---------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains declarations of Call Cost loader. 
//
//===----------------------------------------------------------------------===//

#include "ProfileModule/ProfileModule.h"

/// \brief This function loads from a file the execution cost of external
/// function calls and adds this information in the ProfileModule. The first
/// parameter is the file path.
void loadCallCost(llvm::StringRef, ProfileModule*);
