add_executable (geos-analyser Analyser.cpp)
add_executable (geos-best BestO.cpp)
add_executable (geos-random BestRandom.cpp)

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

TARGET_LINK_LIBRARIES(geos-random GEOS CostEstimator GCOV STATIC ProfileModule 
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  rt dl tinfo atomic pthread z m)


INSTALL(TARGETS geos-analyser geos-best geos-random RUNTIME DESTINATION bin)