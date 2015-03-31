//===--------------- CallCost.cpp - Generate Call's Cost file -------------===//
//
//                The LLVM Time Cost Analyser Infrastructure
//
// This file is distributed under the MIT License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// \brief This file contains implemantation of Call Cost Pass. It instruments 
/// the code to generate a file with the execution time of each external 
/// function. 
/// 
/// To instrument a code to generate Call Cost using clang:
/// opt -strip-debug -load /usr/local/lib/libLLVMCallCost.so -call-cost test.ll
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

using namespace llvm;

#define DEBUG_TYPE "call-cost"

namespace {
  struct CallCost : public ModulePass {
    private:
      void addAttributes(Function* F) {
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

      void initPapi(Module &M, int NumberOfBasicBlocks) {
        IRBuilder<> Builder(M.getContext());

        auto Size = ConstantInt::get(Builder.getInt32Ty(), NumberOfBasicBlocks);
        CallInst *InitPAPICall = Builder.CreateCall(
            M.getFunction("init_PAPI"), Size);

        BasicBlock &EntryBlock = M.getFunction("main")->getEntryBlock();
        EntryBlock.getInstList().push_front(InitPAPICall);

        CallInst *PrintPAPICall = Builder.CreateCall(
            M.getFunction("print_results"));

        BasicBlock &EndBlock   = M.getFunction("main")->back();
        EndBlock.getInstList().insert(
            EndBlock.getInstList().back(), PrintPAPICall);
      }

      void declarePAPIFunctions(Module &M) {
        IRBuilder<> Builder(M.getContext());

        // declare void @PAPI_shutdown()
        FunctionType *FuncType = FunctionType::get(Builder.getVoidTy(), false);
        Function *F = Function::Create(FuncType, Function::ExternalLinkage, 
            "PAPI_shutdown", &M);
        addAttributes(F);

        // declare void @start_measures(i32) #1
        std::vector<Type*> Start_arg_types;                                                                               
        Start_arg_types.push_back(Builder.getInt32Ty());

        FuncType = FunctionType::get(Builder.getVoidTy(), Start_arg_types, true); 
        F = Function::Create(FuncType, Function::ExternalLinkage, 
            "start_measures", &M);   
        addAttributes(F);

        // declare void @get_results(...) #1
        FuncType = FunctionType::get(Builder.getVoidTy(), true);
        F = Function::Create(FuncType, Function::ExternalLinkage, 
            "get_results", &M);   
        addAttributes(F);

        // declare void @init_PAPI(i32) #1  
        std::vector<Type*> Init_arg_types; 
        Init_arg_types.push_back(Builder.getInt32Ty());

        FuncType = FunctionType::get(Builder.getInt32Ty(), Init_arg_types, true); 
        F = Function::Create(FuncType, Function::ExternalLinkage, 
            "init_PAPI", &M);   
        addAttributes(F);

        // declare void @print_results(...) #1  
        FuncType = FunctionType::get(Builder.getInt32Ty(), true); 
        F = Function::Create(FuncType, Function::ExternalLinkage, 
            "print_results", &M);   
        addAttributes(F);
      }

      bool instrumentCall(Instruction  &I, Module &M, int ID) {
        IRBuilder<> Builder(I.getContext());

        // Call starT_measures
        auto ConstantId = ConstantInt::get(Builder.getInt32Ty(), ID);
        CallInst *StartMeasuresCall = Builder.CreateCall(
            M.getFunction("start_measures"), ConstantId);

        // Just add the instruction after all PHINodes 
        StartMeasuresCall->insertBefore(&I);

        // Call get_results
        CallInst *GetResultsCall = Builder.CreateCall(
            M.getFunction("get_results"));

        GetResultsCall->insertAfter(&I);
        return false;
      }

      virtual void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesCFG();
      }
    public:
      static char ID; 
      CallCost() : ModulePass(ID) {}

      bool runOnModule(Module &M) override {
        declarePAPIFunctions(M);

        int N = 0;
        for (auto &F : M) 
          for (auto &BB : F)
            for (auto I = BB.begin(); I != BB.end(); ++I) {
              if (isa<CallInst>(I)) {
                if (cast<CallInst>(I)->getCalledFunction() == nullptr ||
                    cast<CallInst>(I)->getCalledFunction()->size() == 0) {
                  instrumentCall(*I, M, N++);
                  ++I;
                }
              }
            }

        initPapi(M, N);

        return false;
      }
  };
}

char CallCost::ID = 0;
static RegisterPass<CallCost> Y("call-cost", "BB-Prof Basic Block Profiling");
