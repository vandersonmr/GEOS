#!/bin/bash

cd $1

for bench in $(ls); do
  cd $bench

  clang 1/13.ll -lm -ldl -O0 
  echo -n $bench >> stamp
  TIMEFORMAT='%3U'; sudo saferun 0 1.86 "../../executeRealtime.sh a.out"
  cat stamp >> ../../stamp
  rm a.out

  cd ..
done;

cd ..
