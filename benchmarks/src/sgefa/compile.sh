#!/bin/bash

mkdir -p llvm

for o in 0 1 2 3 s z; do
  echo -n "Compiling sgefa in O$o..."
  clang -g -O$o *.c -w -lm -S -emit-llvm
  echo "done"

  echo -n "Linking..."
  mkdir -p llvm/sgefa.o$o
  cp *.ll llvm/sgefa.o$o/
  echo "done"
done

