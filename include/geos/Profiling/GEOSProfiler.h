//===------ include/StaticProfiling.h - Load Static Profile  -*- C++ -*----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of GEOS Profiler.
/// It uses static analysis to mensure the execution frequency of each branch. 
///
//===----------------------------------------------------------------------===//

#include "geos/ProfileModule/ProfileModule.h"
#include "llvm/IR/Module.h"

class GEOSProfiler {
  private:
    void insertInitCode(llvm::Module&, int);
    void addAttributes(llvm::Function*);
    void declareFunctions(llvm::Module&);
    void instrumentBasicBlock(llvm::BasicBlock&, llvm::Module&, int);
    unsigned getNumberOfBasicBlocks(llvm::Module&);

  public:
  /// \brief This function executes ProfileModule using JIT and counts the
  /// execution frequency of each basic block. By the end, its populate the
  /// ProfileModule with this information.
  void populateFrequency(ProfileModule*, llvm::Module*);
};
