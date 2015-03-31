//===--- include/CostEstimator.h - Cost Estimator Interface -*- C++ -*-----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of the cost estimator interface.
///
//===----------------------------------------------------------------------===//

#include "CostEstimator/CostEstimatorOptions.h"
#include "ProfileModule/ProfileModule.h"

namespace CostEstimator {
  extern "C" {
    /// \brief It returns, using the analysis set in the CostEstimatorOptions,
    /// the estimated cost of the given ProfileModule.
    double getModuleCost(const ProfileModule*, CostEstimatorOptions);

    /// \brief It returns, using the analysis set in the CostEstimatorOptions, 
    /// the estimated cost of the function that the name was given. 
    double getFunctionCost(llvm::StringRef, 
        const ProfileModule*, CostEstimatorOptions);
  }
}
