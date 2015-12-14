add_executable (geos-analyser Analyser.cpp)
add_executable (geos-best BestO.cpp)
add_executable (geos-random RandomSearch.cpp)
add_executable (geos-orch Orchestration.cpp)
add_executable (geos-metric CodeMetric.cpp)
add_executable (geos-genetic Genetic.cpp)
add_executable (geos-fmm FMM.cpp)

TARGET_LINK_LIBRARIES(geos-analyser GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-orch GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-best GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-random GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine  
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-genetic GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine  
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-metric GEOS CostEstimator GCOV STATIC ProfileModule 
  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine  
  rt dl tinfo atomic pthread papi z m)

TARGET_LINK_LIBRARIES(geos-fmm GEOS CostEstimator GCOV STATIC GEOSProf 
  ProfileModule  JITExecution
  LLVMIRReader  CallCostReader LLVMBitReader LLVMAsmParser LLVMAnalysis LLVMCore
  LLVMScalarOpts LLVMSupport LLVMTarget LLVMTransformUtils LLVMAnalysis 
  LLVMX86Disassembler LLVMX86AsmParser LLVMX86CodeGen LLVMSelectionDAG 
  LLVMAsmPrinter LLVMCodeGen LLVMScalarOpts LLVMProfileData LLVMInstCombine 
  LLVMTransformUtils LLVMipa LLVMAnalysis LLVMTarget LLVMX86Desc LLVMObject 
  LLVMMCParser LLVMBitReader LLVMMCDisassembler LLVMX86Info LLVMX86AsmPrinter 
  LLVMMC LLVMX86Utils LLVMCore LLVMSupport LLVMInstCombine LLVMBitWriter 
  LLVMObjCARCOpts LLVMInstrumentation LLVMVectorize LLVMProfileData LLVMipo
  LLVMMCJIT LLVMRuntimeDyld LLVMInterpreter LLVMExecutionEngine  
  rt dl tinfo atomic pthread papi z m)

INSTALL(TARGETS geos-orch geos-random geos-best geos-metric geos-analyser geos-fmm
        RUNTIME DESTINATION bin)
