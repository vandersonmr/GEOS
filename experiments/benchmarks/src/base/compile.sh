#!/bin/bash

mkdir -p llvm
for file in $(ls *.c); do
  for o in 0 1 2 3; do
    mkdir -p llvm/${file:0:-2}.o$o
    echo -n "Compiling ${file:0:-2} in O$o..."
    clang -g -O$o -w -S -emit-llvm -lm $file -o llvm/${file:0:-2}.o$o/${file:0:-2}.o$o.ll
    echo "done."
  done;
done

