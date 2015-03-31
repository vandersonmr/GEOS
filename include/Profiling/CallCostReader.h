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

/// \brief It loads call's cost of external functions in the ProfileModule.
void loadCallCost(llvm::StringRef, ProfileModule*);
