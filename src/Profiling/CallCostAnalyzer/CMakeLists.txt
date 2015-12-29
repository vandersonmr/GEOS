
add_subdirectory(CallCostPass)

add_library(GEOSCallCostReader CallCostReader.cpp)

install(TARGETS GEOSCallCostReader ARCHIVE DESTINATION lib)
