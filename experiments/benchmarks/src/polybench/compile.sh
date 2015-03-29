#!/bin/bash

echo "Compiling polybench..."

mkdir -p llvm
clang -g -S -emit-llvm utilities/polybench.c -o polybench.ll -O0

for o in 0 1 2 3; do
  for benchs in $(ls datamining); do
    echo -n "Compiling $benchs in O$o..."
    cd datamining/$benchs
    clang -g -I../../utilities/ -S -emit-llvm *.c -o ../../llvm/${benchs}.o$o.ll -O$o
    cd ../..
    echo "done"
  done;

  for benchs in $(ls linear-algebra/kernels); do
    echo -n "Compiling $benchs in O$o..."
    cd linear-algebra/kernels/$benchs
    clang -g -I../../../utilities/ -S -emit-llvm *.c -o ../../../llvm/${benchs}.o$o.ll -O$o
    cd ../../..
    echo "done"
  done;

  for benchs in $(ls linear-algebra/solvers); do
    echo -n "Compiling $benchs in O$o..."
    cd linear-algebra/solvers/$benchs
    clang -g -I../../../utilities/ -S -emit-llvm *.c -o ../../../llvm/${benchs}.o$o.ll -O$o
    cd ../../..
    echo "done"
  done;

  for benchs in $(ls medley); do
    echo -n "Compiling $benchs in O$o..."
    cd medley/$benchs
    clang -g -I../../utilities/ -S -emit-llvm *.c -o ../../llvm/${benchs}.o$o.ll -O$o
    cd ../..
    echo "done"
  done;

  for benchs in $(ls stencils); do
    echo -n "Compiling $benchs in O$o..."
    cd stencils/$benchs
    clang -g -I../../utilities/ -S -emit-llvm *.c -o ../../llvm/${benchs}.o$o.ll -w -O$o
    cd ../..
    echo "done"
  done;

  echo -n "Linking..."
  cd llvm
  for llvms in $(ls *.o$o.ll); do
    #llvm-link $llvms ../polybench.ll -S > tmp
    mkdir -p ${llvms:0:-3}
    mv $llvms ${llvms:0:-3}/$llvms
    cp ../polybench.ll ${llvms:0:-3}/polybench.ll
  done;
  cd ..
  echo "done"
done;
rm llvm/*.ll
