#!/bin/bash

if [ "$1" == "" ]; then
  echo "Need a system name to create a folder. e.g: ./createDatabase.sh intel"
  exit
fi

cont=false
mkdir $1;
mkdir $1/DB;
mkdir $1/HDB;
for ll in $(ls ../benchmarks/llvm/); do
  ll=../benchmarks/llvm/$ll
  echo $ll
  rm -f tmp.ll
  rm -f tmp

  lsResult=$(ls $1/*.ll 2> /dev/null)
  if [ "$lsResult" == "" ]; then
    cont=true;
  else
    if [ "../benchmarks/llvm/$(ls *.ll)" == "$ll" ]; then
      cont=true
    fi;
  fi;

  if [ "$cont" == true ]; then
    if [ -d $ll ]; then
      llvm-link-3.5 $ll/* -S > $1/tmp.ll 
    else
      cp $ll $1/tmp.ll 
    fi

    opt -load ../../../build/lib/LLVMBBProf.so -bb-prof $1/tmp.ll -S -o tmp.ll 
    opt -load ../../../build/lib/LLVMBBHash.so -bb-hash $1/tmp.ll -S -disable-output \
                                                                       > htmp.ll
    mv htmp.ll $1/HDB/${ll:19}
    clang++ tmp.ll ../src/PAPI.cpp -o tmp -lm -dl -lpapi -O0  
    time ./tmp 2> $1/DB/${ll:19}
    rm $1/tmp.ll
  fi;
  echo "done"
done;

rm tmp;
rm tmp.ll;
rm htmp.ll;
