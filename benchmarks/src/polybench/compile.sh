#!/bin/bash

echo "Compiling polybench..."

mkdir -p llvm
clang -S -emit-llvm utilities/polybench.c -o polybench.ll

for o in 0 1 2 3 s z; do
  for benchs in $(ls datamining); do
    echo -n "Compiling $benchs in O$o..."
    cd datamining/$benchs
    clang -g -I../../utilities/ -S -emit-llvm $(ls *.c) -o ../../llvm/${benchs}.o$o.ll -O$o
    cd ../..
    echo "done"
  done;

  for benchs in $(ls linear-algebra/kernels); do
    echo -n "Compiling $benchs in O$o..."
    cd linear-algebra/kernels/$benchs
    clang -g -I../../../utilities/ -S -emit-llvm $(ls *.c) -o ../../../llvm/${benchs}.o$o.ll -O$o
    cd ../../..
    echo "done"
  done;

  for benchs in $(ls linear-algebra/solvers); do
    echo -n "Compiling $benchs in O$o..."
    cd linear-algebra/solvers/$benchs
    clang -g -I../../../utilities/ -S -emit-llvm $(ls *.c) -o ../../../llvm/${benchs}.o$o.ll -O$o
    cd ../../..
    echo "done"
  done;

  for benchs in $(ls medley); do
    echo -n "Compiling $benchs in O$o..."
    cd medley/$benchs
    clang -g -I../../utilities/ -S -emit-llvm $(ls *.c) -o ../../llvm/${benchs}.o$o.ll -O$o
    cd ../..
    echo "done"
  done;

  for benchs in $(ls stencils); do
    echo -n "Compiling $benchs in O$o..."
    cd stencils/$benchs
    clang -g -I../../utilities/ -S -emit-llvm $(ls *.c) -o ../../llvm/${benchs}.o$o.ll -w -O$o
    cd ../..
    echo "done"
  done;

  echo -n "Linking..."
  for llvms in $(ls llvm/*.o$o.ll); do
    llvm-link-3.5 polybench.ll $llvms > tmp
    mv tmp $llvms
  done;
  echo "done"
done;
