//===---------------- GEOSProf.cpp - Load Call's Cost ---------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains implemantation of GEOS Profiler. It executes a
/// LLVM module and count the execution frequency of each basic block, 
/// populating the ProfileModule.
///
//===----------------------------------------------------------------------===//
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include "geos/Profiling/GEOSProfiler.h"

#define llu long long unsigned

using namespace llvm;

void GEOSProfiler::insertInitCode(Module &M, int NumberOfBasicBlocks) {
  IRBuilder<> Builder(M.getContext());

  auto Size = ConstantInt::get(Builder.getInt32Ty(), NumberOfBasicBlocks);
  CallInst *InitCall = Builder.CreateCall(M.getFunction("init"), Size);

  BasicBlock &EntryBlock = M.getFunction("main")->getEntryBlock();
  EntryBlock.getInstList().push_front(InitCall);
}

void GEOSProfiler::addAttributes(Function* F) {
  // { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" 
  // "no-frame-pointer-elim-non-leaf"="8" "no-infs-fp-math"="false" 
  // "no-nans-fp-math"="false" "unsafe-fp-math"="false" 
  // "use-soft-float"="false" }
  F->addFnAttr("less-precise-fpmad"   , "false");
  F->addFnAttr("no-frame-pointer-elim", "true");
  F->addFnAttr("no-infs-fp-math"      , "false");
  F->addFnAttr("no-nans-fp-math"      , "false");
  F->addFnAttr("unsafe-fp-math"       , "false");
  F->addFnAttr("use-soft-float"       , "false");

  F->addFnAttr("no-frame-pointer-elim-non-leaf", "8");
}

void GEOSProfiler::declareFunctions(Module &M) {
  IRBuilder<> Builder(M.getContext());

  FunctionType *FuncType;
  Function *F;

  // declare void @start_measures(i32) #1
  std::vector<Type*> Start_arg_types;
  Start_arg_types.push_back(Builder.getInt32Ty());

  FuncType = FunctionType::get(Builder.getVoidTy(), Start_arg_types, true); 
  F = Function::Create(FuncType, Function::ExternalLinkage,
      "count", &M);
  addAttributes(F);

  // declare void @init_PAPI(i32) #1
  std::vector<Type*> Init_arg_types;
  Init_arg_types.push_back(Builder.getInt32Ty());

  FuncType = FunctionType::get(Builder.getInt32Ty(), Init_arg_types, true);
  F = Function::Create(FuncType, Function::ExternalLinkage,
      "init", &M);
  addAttributes(F);

  PointerType* PointerTy = PointerType::get(IntegerType::get(M.getContext(), 64), 0);
  FuncType = FunctionType::get(PointerTy, true);
  F = Function::Create(FuncType, Function::ExternalLinkage,
      "get_results", &M);
  addAttributes(F);
}

void GEOSProfiler::instrumentBasicBlock(BasicBlock  &BB, Module &M, int ID) {
  IRBuilder<> Builder(BB.getContext());

  auto ConstantId = ConstantInt::get(Builder.getInt32Ty(), ID);
  CallInst *CountCall = Builder.CreateCall(
      M.getFunction("count"), ConstantId);

  CountCall->insertBefore(BB.getFirstNonPHI());
}

unsigned GEOSProfiler::getNumberOfBasicBlocks(Module &M) {
  unsigned numBB = 0;
  for (auto &F : M)
    for (auto &BB : F)
      ++numBB;
  return numBB;
}

void GEOSProfiler::populateFrequency(ProfileModule *PMod, Module *GEOSPLib) {
  ProfileModule *PModule = PMod->getCopy();
  Module *Mod = PModule->getLLVMModule();
  Module *GEOSProfLib = CloneModule(GEOSPLib);

  declareFunctions(*Mod);

  unsigned ID = 0;
  for (auto &F : *Mod)
    for (auto &BB : F)
      instrumentBasicBlock(BB, *Mod, ID++);

  insertInitCode(*Mod, getNumberOfBasicBlocks(*Mod));

  std::unique_ptr<ExecutionEngine> EE(
                          EngineBuilder(std::unique_ptr<Module>(Mod)).create());

  EE->addModule(std::unique_ptr<Module>(GEOSProfLib));

  EE->finalizeObject();

  std::vector<std::string> Args = {"geos-fmm"};
  EE->runFunctionAsMain(Mod->getFunction("main"), Args, nullptr);

  Function *GetResults = Mod->getFunction("get_results");
  std::vector<GenericValue> noargs;
  GenericValue gv = EE->runFunction(GetResults, noargs);
  llu *ExecutionFrequency = (llu*) gv.PointerVal;

  ID = 0;
  for (auto &F : *PMod->getLLVMModule())
    for (auto &BB : F)
      PMod->setBasicBlockFrequency(BB, ExecutionFrequency[ID++]);

  //FIXME: Memory Leak: PModule and GEOSProfLib
}
