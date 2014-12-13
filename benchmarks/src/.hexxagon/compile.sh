#!/bin/bash

mkdir -p llvm

for o in 0 1 2 3 s z; do
  echo -n "Compiling hexxagon in O$o..."
  clang++ --coverage -g -O$o *.cpp -w -lm -S -emit-llvm
  echo "done"

  echo -n "Linking..."
  llvm-link-3.5 *.ll > llvm/hexxagon.o$o.ll
  echo "done"
done

