//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//

#include "CostEstimator/CostEstimatorOptions.h"
#include "ProfileModule/ProfileModule.h"

namespace CostEstimator {
  extern "C" {
   double getModuleCost(const ProfileModule*, CostEstimatorOptions);

    double getFunctionCost(llvm::StringRef, 
        const ProfileModule*, CostEstimatorOptions);
  }
}
