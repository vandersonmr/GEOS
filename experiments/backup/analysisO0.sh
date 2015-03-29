#!/bin/bash
cd $1

for i in $(ls); do 
  cd $i
  llc $(ls *.ll.bc) -o a.s
  clang a.s -lm -ldl
  TIMEFORMAT='%3U'; (time ./a.out &> /dev/null) &>> stamp
  echo $i " " $(cat stamp) 
  rm a.s
  rm a.out
  rm stamp
  cd ..
done;

cd ..
