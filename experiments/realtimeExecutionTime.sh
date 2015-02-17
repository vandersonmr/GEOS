#!/bin/bash

chmod +x /usr/local/bin/saferun

for i in $(ls benchmarks/llvm/); do
  echo $i
  cp benchmarks/llvm/$i/*.ll .
  llvm-link *.ll > tmp.ll
  opt tmp.ll -strip-debug > tmp2.ll
  clang -O0 -lm -ldl tmp2.ll 
  sudo chmod +x ./a.out
  sudo echo -n $i " " >> stamp
  sudo saferun 0 3.1 "./executeRealtime.sh"
  tail -n 1 stamp
  rm a.out
  rm *.ll
done;
