add_subdirectory(CostEstimator)
add_subdirectory(ProfileModule)
add_subdirectory(Profiling)
add_subdirectory(RealExecutionTime)

add_library(GEOSMain GEOS.cpp)

install(TARGETS GEOSMain ARCHIVE DESTINATION lib)
