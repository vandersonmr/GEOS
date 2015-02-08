add_executable (geos-analyser main.cpp) 

add_library(Analyser AnalysisMethod/FrequencyMethod.cpp 
  AnalysisMethod/InstructionMethod.cpp  
  AnalysisMethod/InstructionPlusHashMethod.cpp AnalysisMethod/HashWeighted.cpp 
  AnalysisMethod/ProfMethod.cpp AnalysisMethod/InstructionCost.cpp 
  AnalysisMethod/RandomMethod.cpp)

TARGET_LINK_LIBRARIES(geos-analyser ProfileModule GEOS LLVMIRReader 
  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
  LLVMTarget LLVMTransformUtils LLVMAnalysis LLVMInstCombine rt dl tinfo atomic 
  pthread z m Analyser DatabaseManager BBHash)

INSTALL(TARGETS geos-analyser RUNTIME DESTINATION bin)
