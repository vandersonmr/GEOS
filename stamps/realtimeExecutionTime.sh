#!/bin/bash

for i in $(ls ../benchmarks/llvm/); do
  echo $i
  cp ../benchmarks/llvm/$i/*.ll .
  clang -O0 -lm -ldl *.ll 
  sudo chmod +x ./a.out
  sudo echo -n *.ll " " >> stamp
  sudo saferun 0 1.86 "./executeRealtime.sh a.out"
  tail -n 1 stamp
  rm a.out
  rm *.ll
done;
