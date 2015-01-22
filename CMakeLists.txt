cmake_minimum_required (VERSION 2.8.7)

project(GEOS)

include_directories("${PROJECT_SOURCE_DIR}/include")

execute_process(COMMAND llvm-config --cxxflags --ldflags 
  OUTPUT_VARIABLE LLVM_CONFIG_N)

string(REPLACE "\n" " " LLVM_CONFIG "${LLVM_CONFIG_N}")

set(CMAKE_CXX_FLAGS "-fno-rtti -O2 -g ${LLVM_CONFIG} -O2")

add_library (DatabaseManager ${PROJECT_SOURCE_DIR}/src/DatabaseManager.cpp)
add_library (BBHash ${PROJECT_SOURCE_DIR}/src/BBHash.cpp)

add_subdirectory (src)
add_subdirectory (src/analyser)
add_subdirectory (src/heuristics)

add_subdirectory (src/passes)
add_subdirectory (unittest)

INSTALL(FILES benchmarks/saferun DESTINATION bin)
