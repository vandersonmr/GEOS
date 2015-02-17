add_executable (geos-analyser Analyser.cpp)

TARGET_LINK_LIBRARIES(geos-analyser GEOS CostEstimator GCOV ProfileModule 
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMInstCombine LLVMBitWriter rt dl tinfo  atomic pthread z m)

INSTALL(TARGETS geos-analyser RUNTIME DESTINATION bin)
