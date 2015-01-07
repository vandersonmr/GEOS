add_executable (geos-random Random.cpp)

TARGET_LINK_LIBRARIES(geos-random ProfileModule GEOS LLVMIRReader 
  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
  LLVMTarget LLVMTransformUtils LLVMAnalysis LLVMInstCombine Analyser 
  LLVMBitWriter DatabaseManager BBHash rt dl tinfo atomic pthread z m)

INSTALL(TARGETS geos-random RUNTIME DESTINATION bin)
