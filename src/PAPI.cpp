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

#define STACK true

#include <stdio.h>
#include <cstdlib>
#if STACK
  #include <stack>
#endif

#include "../include/papi.h"
#include <cmath>

#define TIME 200

int     ID;
int    *Freq;
double *Value;
int     SIZE;

#if STACK
bool NotFinished = false;
std::stack<int> IDsStack;
#endif

long long int getEmpty(int* Events, long long int *Values) { 
  PAPI_start_counters(Events, 2);
  if (IDsStack.empty()) {
  
  } else {

  }
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
  PAPI_stop_counters(values, 2);
  long long int Values2[2];
  Empty = getEmpty(Events, Values2);
  double Stamp = 1.0/((Values[1] - Empty) / ((double)Values[1]/Values[0]));
  if (Stamp > 0) {
    return Stamp;
  } else {
    return 1.0/20.0;
  }
}

void start_measures(int Id) {
#if STACK
  if (!IDsStack.empty()) {
    if (NotFinished) {
      Value[ID] += get_time_stamp();
    }
  }

  notFinished = true;
#endif

  ID = Id;
  if (freq[Id] < TIME) {
    IDsStack.push(ID);
    Freq[Id]++;
    Empty = getEmpty(Events, Values);
    PAPI_start_counters(Events, 2);
  }

}

void get_results() {
  if (!IDsStack.empty()) {
    Value[ID] += get_time_stamp();

#if STACK
    ID = IDsStack.top();
    IDsStack.pop();

    if (!IDsStack.empty()) {
      ID = IDsStack.top();
      IDsStack.pop();

      Empty = getEmpty(Events, Values);
      PAPI_start_counters(events, 2);
    }

    NotFinished = false;
#endif
  }
}

void print_results() {
  for (int i = 0; i < SIZE; i++) 
    if (freq[i] > 0 && value[i] > 0) 
      fprintf(stderr, "%d: %d\n", i, (int) ceil(1.0/(value[i]/freq[i])));
}
