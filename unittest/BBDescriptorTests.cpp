#include "BBDescriptor.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"

#include "gtest/gtest.h"

using namespace llvm;

BBDescriptor* DescriptorWithoutArguments;
BBDescriptor* DescriptorOfBasicBlock;
BBDescriptor* DescriptorFromString;
std::unique_ptr<Module> TestModule;

TEST(BBDescriptor, constructors) {
  LLVMContext  Context;
  SMDiagnostic Error;
  TestModule = parseIRFile("test.ll", Error, Context);

  DescriptorWithoutArguments = nullptr;
  DescriptorOfBasicBlock     = nullptr;
  DescriptorFromString       = nullptr;  

  DescriptorWithoutArguments = new BBDescriptor(); 
  ASSERT_NE(DescriptorWithoutArguments, nullptr);
  ASSERT_EQ(DescriptorWithoutArguments->
    getDescription(Descriptor::NumberOfInstructions), 0);
  
  for (Function& func : *TestModule) {
    for (BasicBlock& bb : func) {
      DescriptorOfBasicBlock = new BBDescriptor(bb); 
      ASSERT_NE(DescriptorOfBasicBlock, nullptr);
      ASSERT_GT(DescriptorOfBasicBlock->
          getDescription(Descriptor::NumberOfInstructions), 0);
      delete DescriptorOfBasicBlock;
    }
  }
  
  ASSERT_DEATH(new BBDescriptor(""),
      ".*The string representation of a BBDescriptor cannot be empty\\..*"); 

  ASSERT_DEATH(new BBDescriptor("sdfsdfs"), 
      ".*The string representation of a BBDescriptor is in a bad format\\..*"); 

  DescriptorFromString = 
    new BBDescriptor((StringRef("162-11-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0") +
        StringRef("-0-0-0-1-0-15-22-0-0-0-9-0-0-0-0")).str()); 
  ASSERT_NE(DescriptorFromString, nullptr);
}

TEST(BBDescriptor, setingDescriptors) {
 // int OldValue = DescriptorFromString->getDescription(Descriptor::); 
}

TEST(BBDescriptor, addingUpDescriptors) {
}

TEST(BBDescriptor, getingDescriptions) {
}

TEST(BBDescriptor, generatingStrings) {
}

TEST(BBDescriptor, calculatingDistances) {
  TestModule.release();
}
