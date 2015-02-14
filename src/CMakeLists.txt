add_library(GEOS GEOS.cpp)

TARGET_LINK_LIBRARIES(
  llvm-merge LLVMCore LLVMSupport rt dl tinfo atomic pthread z m) 

INSTALL(FILES saferun DESTINATION bin)
