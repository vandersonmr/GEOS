//===-- GEOS.cpp -  Guide to Exploration of Otimization's Set -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains implementation of the GEOS's main functions. Which
/// are responsable for interfacing heuristics that want to explore, in a 
/// fast way, the otmization's space set. 
///
//===----------------------------------------------------------------------===//

#include "GEOS.h"

#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Transforms/Scalar.h"

using namespace llvm;

ProfileModule* 
GEOS::applyPasses(const ProfileModule& PModule, FunctionPassManager& PM) {
  ProfileModule *ModuleCopy = PModule.getCopy();
  Module        *MyModule   = ModuleCopy->getLLVMModule();

  for (auto& Func : *MyModule)
    PM.run(Func);

  return ModuleCopy; 
}

double 
GEOS::analyseExecutionTime(const ProfileModule& PModule, AnalysisMethods Method, 
    StringRef DatabaseFilename = "") {
  AnalysisMethod *Analyser;

  switch (Method) {
    case hashM:
      if (!DatabaseFilename.empty())
        Analyser = new HashMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case hashWM:
      if (!DatabaseFilename.empty())
        Analyser = new HashWeightedMethod(DatabaseFilename);
      else
        errs() 
          << "For hashM you must pass a database filename with -database\n";
      break;
    case instM:
      Analyser = new InstructionMethod();
      break;
    case instCostM:
      Analyser = new InstructionCostMethod();
      break;
    case randM:
      Analyser = new RandomMethod();
      break;
    case freqM:
      Analyser = new FrequencyMethod();
      break;
    case hashPlusInstM:
      if (!DatabaseFilename.empty())
        Analyser = new InstructionPlusHashMethod(DatabaseFilename);
      else
        errs() << "For hashPlusInstM you must pass a database filename with" <<
          " -database\n";
      break;
    default:
      Analyser = new InstructionMethod();
      break;
  }

  double PerformanceMensurment = 0;

  Module *MyModule = PModule.getLLVMModule();

  for (auto &FreqFunc : PModule.getProfile()) {
    Function *LLVMFunc = MyModule->getFunction(FreqFunc->getName());
    assert(LLVMFunc != nullptr 
        && "Trying to access a LLVM Function that don't exist!");

    PerformanceMensurment += 
      Analyser->estimateExecutionTime(LLVMFunc, FreqFunc);
  }

  return PerformanceMensurment;
}
