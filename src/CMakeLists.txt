add_subdirectory(CostEstimator)
add_subdirectory(ProfileModule)
add_subdirectory(Profiling)

add_library(GEOS GEOS.cpp)

INSTALL(FILES saferun DESTINATION bin)
