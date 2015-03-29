add_executable (geos-analyser Analyser.cpp)
add_executable (geos-best BestO.cpp)

TARGET_LINK_LIBRARIES(geos-analyser GEOS CostEstimator GCOV STATIC ProfileModule 
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  rt dl tinfo atomic pthread z m)

FIND_PACKAGE( OpenMP REQUIRED)
if(OPENMP_FOUND)
  message("OPENMP FOUND")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()

TARGET_LINK_LIBRARIES(geos-best GEOS CostEstimator GCOV STATIC ProfileModule 
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  rt dl tinfo atomic pthread z m)

INSTALL(TARGETS geos-analyser geos-best RUNTIME DESTINATION bin)
