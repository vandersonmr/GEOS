#!/bin/bash

mkdir -p res
for file in $(ls ../benchmarks/llvm/*.o0.*); do
  echo ${file:19}

  mkdir -p res/${file:19}/
  opt-3.5 -strip-debug $file > res/${file:19}/${file:19}.bc

done;

cd res/
for i in $(ls -d ../../../llvm/projects/llvm-project/dataAnalysis/tmp/*.o0.ll); do 
  cp $i/*.gc* ./${i:53}/
done;

for i in $(ls); do 
  cd $i
  for n in $(seq 1 10); do
    mkdir -p $n
    cd $n
      geos-random -ll ../$i.bc -ga ../${i:0:-6}.gcda -go ../${i:0:-6}.gcno \
        -db ../../../../unittest/db -randM | tee saida
    cd ..
  done;
  cd ..
done;

cd ../
