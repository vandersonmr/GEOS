//===------ PAPI.cpp - PAPI Functions for time mensurements -*- C -*-------===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of a set of functions used to
/// mensure the execution time of blocks of codes. Calls for this functions can
/// be inserted in a code two get information of its execution.
///
//===----------------------------------------------------------------------===//


#include <stdio.h>
#include <cstdlib>

#include "../../../../include/Profiling/papi.h"
#include <cmath>

#define TIME 200

int     ID;
int    *Freq;
double *Value;
int     SIZE;

long long int getEmpty(int* Events, long long int *Values) { 
  PAPI_start_counters(Events, 2);
  PAPI_stop_counters(Values, 2);

  return Values[1];
}

void init_PAPI(int Size) {
  Freq  = (int*)    malloc(sizeof(int)   *Size);
  Value = (double*) malloc(sizeof(double)*Size);
  SIZE  = Size;

  for (int i = 0; i < Size; i++) {
    Freq[i]  = 0;
    Value[i] = 0;
  }

  PAPI_library_init(PAPI_VER_CURRENT);
  Events[0] = PAPI_TOT_CYC;
  Events[1] = PAPI_TOT_INS;
  getEmpty(Events, Values);
}

double get_time_stamp() {
  PAPI_stop_counters(Values, 2);
  long long int Values2[2];
  Empty = getEmpty(Events, Values2);
  double Stamp = 1.0/((Values[1] - Empty) / ((double)Values[1]/Values[0]));
  return Stamp;
}

void start_measures(int Id) {
  ID = Id;
  if (Freq[Id] < TIME) {
    Freq[Id]++;
    Empty = getEmpty(Events, Values);
    PAPI_start_counters(Events, 2);
  }
}

void get_results() {
  Value[ID] += get_time_stamp();
}

void print_results() {
  for (int i = 0; i < SIZE; i++) 
    if (Freq[i] > 0 && Value[i] > 0) 
      fprintf(stderr, "%d: %d\n", i, (int) ceil(1.0/(Value[i]/Freq[i])));
}
