add_executable (llvm-analyser main.cpp 
  AnalysisMethod/FrequencyMethod.cpp AnalysisMethod/InstructionMethod.cpp
  AnalysisMethod/HashMethod.cpp AnalysisMethod/InstructionPlusHashMethod.cpp
  AnalysisMethod/HashWeighted.cpp AnalysisMethod/ProfMethod.cpp
  AnalysisMethod/InstructionCost.cpp AnalysisMethod/RandomMethod.cpp)

TARGET_LINK_LIBRARIES(llvm-analyser LLVMIRReader LLVMBitReader 
  LLVMAsmParser LLVMCore LLVMSupport rt dl tinfo atomic pthread z m 
  DatabaseManager BBDescriptor) 

INSTALL(TARGETS llvm-analyser RUNTIME DESTINATION bin)
