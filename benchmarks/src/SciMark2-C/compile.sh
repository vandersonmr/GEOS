#!/bin/bash

mkdir -p llvm

for o in 0 1 2 3 s z; do
  echo -n "Compiling SciMark2-C in O$o..."
  clang -g -O$o *.c -w -lm -S -emit-llvm
  echo "done"

  echo -n "Linking..."
  mkdir -p llvm/scimark2.o$o
  mv *.ll llvm/scimark2.o$o
  #llvm-link-3.5 *.ll > llvm/scimark2.o$o.ll
  echo "done"
done

