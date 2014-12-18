#include "gtest/gtest.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"

#include "DatabaseManager.h"

using namespace llvm;

std::unique_ptr<Module> TestModule;

#include "BBDescriptorTests.cpp"
#include "DatabaseManagerTests.cpp"

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
