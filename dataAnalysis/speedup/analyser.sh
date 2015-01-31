#!/bin/bash

cd $1

for bench in $(ls); do
  cd $bench

  best=$(echo "$(for i in $(seq 1 10); do
    cd $i
    echo -n $i $bench
    cat saida | tail -n 1
    cd ..
  done;)" | sort -nr -k4 | head -n1)
  
  echo -n $best " "
  
  cd $(echo $best | cut -d' ' -f1)
  llc $(ls *.ll | head -n1) -o a.s
  clang a.s -lm -ldl 
  TIMEFORMAT='%3U'; (time ./a.out &> /dev/null) &>> stamp
  echo $(cat stamp)
  rm stamp
  rm a.s
  rm a.out
  cd ..

  cd ..
done;

cd ..
