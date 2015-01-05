add_executable (llvm-analyser main.cpp) 

add_library(Analyser AnalysisMethod/FrequencyMethod.cpp 
  AnalysisMethod/InstructionMethod.cpp AnalysisMethod/HashMethod.cpp 
  AnalysisMethod/InstructionPlusHashMethod.cpp AnalysisMethod/HashWeighted.cpp 
  AnalysisMethod/ProfMethod.cpp AnalysisMethod/InstructionCost.cpp 
  AnalysisMethod/RandomMethod.cpp)

TARGET_LINK_LIBRARIES(llvm-analyser ProfileModule GEOS LLVMIRReader 
  LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore LLVMScalarOpts LLVMSupport 
  LLVMTarget LLVMTransformUtils LLVMAnalysis rt dl tinfo atomic pthread z m 
  Analyser DatabaseManager BBHash)

INSTALL(TARGETS llvm-analyser RUNTIME DESTINATION bin)
