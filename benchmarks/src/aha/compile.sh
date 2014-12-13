#!/bin/bash

mkdir -p llvm

for o in 0 1 2 3 s z; do
  echo -n "Compiling aha in O$o..."
  clang -g -O$o *.c -w -lm -S -emit-llvm
  echo "done"

  echo -n "Linking..."
  mkdir -p llvm/aha.o$o
  mv *.ll llvm/aha.o$o
  #llvm-link-3.5 *.ll > llvm/aha.o$o.ll
  echo "done"
done

