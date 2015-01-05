//== include/GEOS.h - Guide to Exploration of Otimization's Set  -*- C++ -*===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of GEOS main functions. 
/// Which are responsable for interfacing with heuristics for otimization's set
/// exploration. 
///
//===----------------------------------------------------------------------===//

#ifndef GEOS_H
#define GEOS_H

#include "AnalysisMethod.h"
#include "ProfileModule.h"

#include "llvm/PassManager.h"

/// \brief This clss is responsable for apply passes into a ProfileModule, which
/// contatains the LLVM code and the profiling information, and also analyse its
/// execution time. 
class GEOS {
  public:
    /// \brief Apply Passes (Transformations) into a ProfileModule. Also ensures
    /// that its profiling information ramains consistent. The ProfileModule 
    /// given as parameter isn't modified, actualy all the modifications are
    /// made in a copy. This copy is returned as parameter.
    static ProfileModule* 
      applyPasses(const ProfileModule&, llvm::FunctionPassManager&);
   
    /// \brief analysis the execution time of a ProfileModule with the choosen
    /// method and returns it. 
    static double analyseExecutionTime(const ProfileModule&, AnalysisMethods,
        llvm::StringRef);
};

#endif
