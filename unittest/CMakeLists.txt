add_subdirectory(gtest)

include_directories("gtest/include/")

add_executable(test AllTests.cpp)

TARGET_LINK_LIBRARIES(test gtest gtest_main LLVMIRReader LLVMBitReader 
  LLVMAsmParser LLVMCore LLVMSupport rt dl tinfo atomic pthread z m 
  BBHash DatabaseManager)

INSTALL(TARGETS test DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
