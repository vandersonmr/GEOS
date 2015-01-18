#define SIZE 35

BBHash* DescriptorWithoutArguments;
BBHash* DescriptorOfBasicBlock;
BBHash* DescriptorFromString;

TEST(BBHash, constructors) {
  LLVMContext  Context;
  SMDiagnostic Error;
  TestModule = parseIRFile("test.ll", Error, Context);

  DescriptorWithoutArguments = nullptr;
  DescriptorOfBasicBlock     = nullptr;
  DescriptorFromString       = nullptr;  

  DescriptorWithoutArguments = new BBHash(); 
  ASSERT_NE(DescriptorWithoutArguments, nullptr);
  ASSERT_EQ(DescriptorWithoutArguments->
      getDescriptor(DescriptorKind::NumberOfInstructions), 0);

  for (Function& func : *TestModule) {
    for (BasicBlock& bb : func) {
      DescriptorOfBasicBlock = new BBHash(bb); 
      ASSERT_NE(DescriptorOfBasicBlock, nullptr);
      ASSERT_GT(DescriptorOfBasicBlock->
          getDescriptor(DescriptorKind::NumberOfInstructions), 0);
      delete DescriptorOfBasicBlock;
    }
  }

  DescriptorOfBasicBlock = new BBHash(*(TestModule->begin()->begin())); 

  ASSERT_DEATH(new BBHash(""),
      ".*The string representation of a BBHash cannot be empty\\..*"); 

  ASSERT_DEATH(new BBHash("sdfsdfs"), 
      ".*The string representation of a BBHash is in a bad format\\..*"); 

  DescriptorFromString = 
    new BBHash((StringRef("162-11-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0") +
          StringRef("-0-0-0-1-0-15-22-0-0-0-9-0-0-0-0")).str()); 
  ASSERT_NE(DescriptorFromString, nullptr);
}

TEST(BBHash, setingDescriptors) {
  int OldValue = 
    DescriptorFromString->getDescriptor(DescriptorKind::NumberOfInstructions); 

  DescriptorFromString->setDescriptor(DescriptorKind::NumberOfInstructions, 10);

  ASSERT_NE(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), OldValue); 

  ASSERT_EQ(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), 10); 

  ASSERT_DEATH(DescriptorFromString->setDescriptor((DescriptorKind) -1, 10),
      ".*Trying to set an invalid descriptor\\..*");  
  ASSERT_DEATH(DescriptorFromString->setDescriptor((DescriptorKind) 1, -10), 
      ".*The value of an descriptor must be greater than 0\\..*");  
}

TEST(BBHash, addingUpDescriptors) {
  int OldValue = 
    DescriptorFromString->getDescriptor(DescriptorKind::NumberOfInstructions); 

  DescriptorFromString->addUpDescriptor(DescriptorKind::NumberOfInstructions);

  ASSERT_NE(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), OldValue); 

  DescriptorFromString->addUpDescriptor(DescriptorKind::NumberOfInstructions, 2); 

  ASSERT_NE(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), OldValue); 

  ASSERT_EQ(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), OldValue + 3); 

  ASSERT_DEATH(DescriptorFromString->addUpDescriptor((DescriptorKind) -1, 10),
      ".*Trying to get the value of an invalid descriptor\\..*");  

  DescriptorFromString->addUpDescriptor((DescriptorKind) 0, -3);

  ASSERT_EQ(DescriptorFromString->
      getDescriptor(DescriptorKind::NumberOfInstructions), OldValue); 
}

TEST(BBHash, getingDescriptions) {
  for (int i = 0; i < SIZE; i++) {
    ASSERT_EQ(DescriptorWithoutArguments->
        getDescriptor(static_cast<DescriptorKind>(i)), 0);
  }

  ASSERT_DEATH(DescriptorFromString->getDescriptor(
      static_cast<DescriptorKind>(-1)), 
      ".*Trying to get the value of an invalid descriptor\\..*");  

  ASSERT_DEATH(DescriptorFromString->getDescriptor(
        static_cast<DescriptorKind>(SIZE+1)),
      ".*Trying to get the value of an invalid descriptor\\..*");  
}

TEST(BBHash, generatingStrings) {
  ASSERT_STREQ(DescriptorFromString->getString().str().c_str(), 
   "10-11-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-1-0-15-22-0-0-0-9-0-0-0-0");
  ASSERT_STREQ(DescriptorWithoutArguments->getString().str().c_str(), 
   "0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0");
  ASSERT_STREQ(DescriptorOfBasicBlock->getString().str().c_str(), 
   "26-0-0-0-1-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-4-1-0-0-0-1-0-0-0-0");
}

TEST(BBHash, calculatingDistances) {
  ASSERT_EQ(BBHash::distance(*DescriptorWithoutArguments,
        *DescriptorWithoutArguments), 0);
  ASSERT_EQ(BBHash::distance(*DescriptorFromString,
        *DescriptorFromString), 0);
  ASSERT_EQ(BBHash::distance(*DescriptorOfBasicBlock,
        *DescriptorOfBasicBlock), 0);

/*  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorWithoutArguments,
        *DescriptorFromString), 31.827660925679098);
  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorFromString,
        *DescriptorOfBasicBlock), 31.685959035509718);*/
/*  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorOfBasicBlock,
        *DescriptorWithoutArguments), 26.362852652928137);*/

  ASSERT_DOUBLE_EQ(
      BBHash::distance(*DescriptorFromString  , *DescriptorOfBasicBlock),
      BBHash::distance(*DescriptorOfBasicBlock, *DescriptorFromString));

  ASSERT_EQ(BBHash::distance(*DescriptorWithoutArguments,
        *DescriptorWithoutArguments), 0);
  ASSERT_EQ(BBHash::distance(*DescriptorFromString,
        *DescriptorFromString), 0);
  ASSERT_EQ(BBHash::distance(*DescriptorOfBasicBlock,
        *DescriptorOfBasicBlock), 0);

  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorWithoutArguments,
        *DescriptorFromString), 43.405068828421413);
  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorFromString,
        *DescriptorOfBasicBlock), 41.158231254513353);
  ASSERT_DOUBLE_EQ(BBHash::distance(*DescriptorOfBasicBlock,
        *DescriptorWithoutArguments), 26.720778431774775);

  ASSERT_DOUBLE_EQ(
      BBHash::distance(*DescriptorFromString, 
        *DescriptorOfBasicBlock),
      BBHash::distance(*DescriptorOfBasicBlock, 
        *DescriptorFromString));

  TestModule.release();
}
