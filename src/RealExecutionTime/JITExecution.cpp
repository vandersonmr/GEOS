//===---- include/CostAnalysis.h - Basic Block Cost Estimator -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis of the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//

#include "llvm/ExecutionEngine/MCJIT.h"

#include "RealExecutionTime/ExecutionTimeMeasurer.h"

using namespace llvm;

ExecutionEngine *EE;
Function *EntryFn;

JITExecution::JITExecution(const ProfileModule *PMod) {
  PModule = PMod->getCopy();
  Module *Mod = PModule->getLLVMModule();
  EE = EngineBuilder(std::unique_ptr<Module>(Mod)).create();
  EntryFn = Mod->getFunction("main");
  EE->finalizeObject();
}

void JITExecution::run(std::vector<std::string> &Argv, char* const* Envp) {
  EE->runFunctionAsMain(EntryFn, Argv, Envp);
}

JITExecution::~JITExecution() {
  delete PModule;
  delete EE;
}
