#include "BBDescriptor.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"

#include "gtest/gtest.h"

using namespace llvm;

#define SIZE 35

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

  DescriptorOfBasicBlock = new BBDescriptor(*(TestModule->begin()->begin())); 

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
  int OldValue = 
    DescriptorFromString->getDescription(Descriptor::NumberOfInstructions); 

  DescriptorFromString->set(Descriptor::NumberOfInstructions, 10);

  ASSERT_NE(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), OldValue); 

  ASSERT_EQ(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), 10); 

  ASSERT_DEATH(DescriptorFromString->set((Descriptor) -1, 10),
      ".*Trying to set an invalid descriptor\\..*");  
  ASSERT_DEATH(DescriptorFromString->set((Descriptor) 1, -10), 
      ".*The value of an descriptor must be greater than 0\\..*");  
}

TEST(BBDescriptor, addingUpDescriptors) {
  int OldValue = 
    DescriptorFromString->getDescription(Descriptor::NumberOfInstructions); 

  DescriptorFromString->addUp(Descriptor::NumberOfInstructions);

  ASSERT_NE(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), OldValue); 

  DescriptorFromString->addUp(Descriptor::NumberOfInstructions, 2); 

  ASSERT_NE(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), OldValue); 

  ASSERT_EQ(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), OldValue + 3); 

  ASSERT_DEATH(DescriptorFromString->addUp((Descriptor) -1, 10),
      ".*Trying to get the value of an invalid descriptor\\..*");  

  DescriptorFromString->addUp((Descriptor) 0, -3);

  ASSERT_EQ(DescriptorFromString->
      getDescription(Descriptor::NumberOfInstructions), OldValue); 
}

TEST(BBDescriptor, getingDescriptions) {
  for (int i = 0; i < SIZE; i++) {
    ASSERT_EQ(DescriptorWithoutArguments->
        getDescription(static_cast<Descriptor>(i)), 0);
  }

  ASSERT_DEATH(DescriptorFromString->getDescription(
      static_cast<Descriptor>(-1)), 
      ".*Trying to get the value of an invalid descriptor\\..*");  

  ASSERT_DEATH(DescriptorFromString->getDescription(
        static_cast<Descriptor>(SIZE+1)),
      ".*Trying to get the value of an invalid descriptor\\..*");  
}

TEST(BBDescriptor, generatingStrings) {
  ASSERT_STREQ(DescriptorFromString->getString().str().c_str(), 
   "10-11-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-1-0-15-22-0-0-0-9-0-0-0-0");
  ASSERT_STREQ(DescriptorWithoutArguments->getString().str().c_str(), 
   "0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0");
  ASSERT_STREQ(DescriptorOfBasicBlock->getString().str().c_str(), 
   "26-0-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-4-1-0-0-0-1-0-0-0-0");
}

TEST(BBDescriptor, calculatingDistances) {
  ASSERT_EQ(BBDescriptor::distance(*DescriptorWithoutArguments,
        *DescriptorWithoutArguments), 0);
  ASSERT_EQ(BBDescriptor::distance(*DescriptorFromString,
        *DescriptorFromString), 0);
  ASSERT_EQ(BBDescriptor::distance(*DescriptorOfBasicBlock,
        *DescriptorOfBasicBlock), 0);

  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorWithoutArguments,
        *DescriptorFromString), 31.827660925679098);
  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorFromString,
        *DescriptorOfBasicBlock), 31.685959035509718);
  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorOfBasicBlock,
        *DescriptorWithoutArguments), 26.362852652928137);

  ASSERT_DOUBLE_EQ(
      BBDescriptor::distance(*DescriptorFromString  , *DescriptorOfBasicBlock),
      BBDescriptor::distance(*DescriptorOfBasicBlock, *DescriptorFromString));

  ASSERT_EQ(BBDescriptor::distance(*DescriptorWithoutArguments,
        *DescriptorWithoutArguments, true), 0);
  ASSERT_EQ(BBDescriptor::distance(*DescriptorFromString,
        *DescriptorFromString, true), 0);
  ASSERT_EQ(BBDescriptor::distance(*DescriptorOfBasicBlock,
        *DescriptorOfBasicBlock, true), 0);

  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorWithoutArguments,
        *DescriptorFromString, true), 43.405068828421413);
  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorFromString,
        *DescriptorOfBasicBlock, true), 41.158231254513353);
  ASSERT_DOUBLE_EQ(BBDescriptor::distance(*DescriptorOfBasicBlock,
        *DescriptorWithoutArguments, true), 26.720778431774775);

  ASSERT_DOUBLE_EQ(
      BBDescriptor::distance(*DescriptorFromString, 
        *DescriptorOfBasicBlock, true),
      BBDescriptor::distance(*DescriptorOfBasicBlock, 
        *DescriptorFromString, true));

  TestModule.release();
}
