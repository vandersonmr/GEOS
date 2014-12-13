#!/bin/bash

mkdir -p llvm

for o in 0 1 2 3 s z; do
  echo -n "Compiling sgefa in O$o..."
  clang -g -O$o *.c -w -lm -S -emit-llvm
  echo "done"

  echo -n "Linking..."
  mkdir -p llvm/sgefa.o$o
  mv *.ll llvm/sgefa.o$o
  #llvm-link-3.5 *.ll -S > llvm/sgefa.o$o.ll
  echo "done"
done

