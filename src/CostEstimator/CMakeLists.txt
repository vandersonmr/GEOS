add_subdirectory(CostAnalysis)

add_library(GEOSCostEstimator CostEstimator.cpp 
  $<TARGET_OBJECTS:RandomCost>
  $<TARGET_OBJECTS:BranchAnalysis>
  $<TARGET_OBJECTS:CallAnalysis>
  $<TARGET_OBJECTS:CacheAnalysis>
  $<TARGET_OBJECTS:StaticInstructionAnalysis>
  $<TARGET_OBJECTS:TTIAnalysis>
  )

install(TARGETS GEOSCostEstimator ARCHIVE DESTINATION lib)
