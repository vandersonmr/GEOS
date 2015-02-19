#!/bin/bash

chmod +x /usr/local/bin/saferun

mkdir -p gcovs
parallel --gnu 'echo Compiling {/}; cd gcovs/{/}; opt -strip-debug -load /usr/local/lib/libLLVMCallCost.s
parallel --gnu 'echo Chmoding {1}; chmod +x ./{1}/a.out;' ::: gcovs/*/

for i in $(ls gcovs/* -d); do
  rm $i/callcost
  echo Exec $i; 
  sudo saferun 0 1.8 "./$i/a.out 2> $i/callcost";
  sudo chown vanderson $i/callcost
done
