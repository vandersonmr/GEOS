#!/bin/bash

if [ "$1" == "" ]; then
  echo "Need a system name to create a folder. e.g: ./createDatabase.sh intel"
  exit
fi

sudo chmod +x /usr/local/bin/saferun

mkdir -p $1;
mkdir -p $1/DB;
mkdir -p $1/HDB;

for ll in $(ls ../benchmarks/llvm/* -d); do
  ll=$ll
  echo $ll
  rm -f tmp.ll
  rm -f tmp

  cp $ll/*.ll $1/tmp.ll

  opt -load /usr/local/lib/libLLVMBBProf.so -bb-prof $1/tmp.ll -S -o tmp.ll 
  opt -load /usr/local/lib/libLLVMBBHash.so -extract-bb-hash $1/tmp.ll -S \
    -disable-output > htmp.ll

  mv htmp.ll $1/HDB/${ll:19}
  clang++ tmp.ll ../src/PAPI.cpp -o tmp -lm -ldl -lpapi -O0  
  time sudo saferun 0 1.86 "./tmp 2> $1/DB/${ll:19}"
  rm $1/tmp.ll

  echo "done"
done;

rm tmp;
rm tmp.ll;
rm htmp.ll;
