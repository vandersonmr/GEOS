//===--- GEOSProfLib.cpp - PAPI Functions for time mensurements -*- C -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//
////===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements functions used to count the execution frequency
/// of a LLVM code.
///
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include <cstdlib>

#include <cmath>

#define llu long long unsigned

extern int main(int argc, char **argv, char **envp);

extern "C" {
  llu *ExecutionFrequency;
  int SIZE;

  void init(int Size) {
    ExecutionFrequency = (llu*) malloc(sizeof(llu) * Size);
    SIZE = Size;
    for (int i = 0; i < SIZE; i++) 
      ExecutionFrequency[i] = 0;
  }

  void count(unsigned Id) {
    ++ExecutionFrequency[Id];
  }

  llu* get_results() {
    return ExecutionFrequency;
  }
}
