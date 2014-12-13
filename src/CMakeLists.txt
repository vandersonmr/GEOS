add_executable (llvm-merge mergeDatabase.cpp)

TARGET_LINK_LIBRARIES(llvm-merge DatabaseManager BBDescriptor LLVMCore LLVMSupport rt dl tinfo atomic pthread z m) 

INSTALL(TARGETS llvm-merge RUNTIME DESTINATION bin)
