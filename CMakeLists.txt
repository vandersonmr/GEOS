cmake_minimum_required (VERSION 2.8.8)

project (GEOS2.0)

include_directories ("${PROJECT_SOURCE_DIR}/include")

execute_process (COMMAND llvm-config --cxxflags --ldflags 
  OUTPUT_VARIABLE LLVM_CONFIG_N)

string (REPLACE "\n" " " LLVM_CONFIG "${LLVM_CONFIG_N}")

set (CMAKE_CXX_FLAGS 
  "-std=c++14 -fno-rtti -Wall -Wextra -Werror -Wno-ignored-qualifiers -Wno-unused-function -Wno-unused-parameter -Wno-unused-variable -g ${LLVM_CONFIG} -O0")

add_subdirectory (src)
add_subdirectory (tools)

install (DIRECTORY "${PROJECT_SOURCE_DIR}/include/geos" DESTINATION include) 
