add_library(GEOSStatic StaticProfiling.cpp)

install(TARGETS GEOSStatic ARCHIVE DESTINATION lib)
