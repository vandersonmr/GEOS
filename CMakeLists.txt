cmake_minimum_required (VERSION 2.8.7)

project (GEOS VERSION 1.0.0)

include_directories ("${PROJECT_SOURCE_DIR}/include")

execute_process (COMMAND llvm-config --cxxflags --ldflags 
  OUTPUT_VARIABLE LLVM_CONFIG_N)

string (REPLACE "\n" " " LLVM_CONFIG "${LLVM_CONFIG_N}")

set (CMAKE_CXX_FLAGS "-fno-rtti -g -O0 ${LLVM_CONFIG} -O0")

add_subdirectory (src)
add_subdirectory (test)
