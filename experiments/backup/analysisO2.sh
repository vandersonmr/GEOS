#!/bin/bash

for i in $(ls ../benchmarks/llvm/*.o2.ll); do 
  cp $i a.ll
  opt-3.5 -strip-debug a.ll > a.bc 2> /dev/null
  llc a.bc -o a.s
  clang a.s -lm -ldl
  TIMEFORMAT='%3U'; (time ./a.out &> /dev/null) &>> stamp
  echo ${i:19} " " $(cat stamp) 
  rm a.s
  rm a.out
  rm stamp
  rm a.bc
  rm a.ll
done;

cd ..
