#!/bin/bash

TIMEFORMAT='%3U'

for i in $(seq 1 10); do
  echo $i;
  (time ./a.out &> /dev/null) &>> stampTmp;
done;

sort -n stampTmp | head -n -1 | tail -n -8 | awk '{s+=$1} END {print s/NR}' >> stamp
rm stampTmp
