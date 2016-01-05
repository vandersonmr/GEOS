//===------ include/StaticProfiling.h - Load Static Profile  -*- C++ -*----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of Profile Loader. 
/// It uses static analysis to mensure the execution frequency of each branch. 
///
//===----------------------------------------------------------------------===//

#include "geos/ProfileModule/ProfileModule.h"

/// \brief This function estimate the execution frequency of each branch and
/// add this information in the Profile Module.
void loadStaticProfiling(ProfileModule*);
