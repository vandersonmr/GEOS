#add_executable (geos-random Random.cpp)
#add_executable (geos-randomOnFunction RandomOnFunction.cpp)
add_executable (geos-test Test.cpp)

#TARGET_LINK_LIBRARIES(geos-random ProfileModule GEOS LLVMIRReader 
#  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
#  LLVMTarget LLVMTransformUtils LLVMAnalysis LLVMInstCombine Analyser 
#  LLVMBitWriter DatabaseManager BBHash rt dl tinfo atomic pthread z m)

#TARGET_LINK_LIBRARIES(geos-randomOnFunction ProfileModule GEOS LLVMIRReader 
#  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
#  LLVMTarget LLVMTransformUtils LLVMAnalysis LLVMInstCombine Analyser 
#  LLVMBitWriter DatabaseManager BBHash rt dl tinfo atomic pthread z m)

TARGET_LINK_LIBRARIES(geos-test ProfileModule GEOS LLVMIRReader 
  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
  LLVMTarget LLVMTransformUtils LLVMAnalysis LLVMInstCombine Analyser 
  LLVMBitWriter DatabaseManager BBHash rt dl tinfo atomic pthread z m)

#INSTALL(TARGETS geos-random geos-randomOnFunction geos-test 
INSTALL(TARGETS geos-test
  RUNTIME DESTINATION bin)
