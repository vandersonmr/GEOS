#!/bin/bash

for i in `ls gcovs/`; do
  if [[ $i == *o0 ]]; then
    cd gcovs/$i
    echo -n $i " "
    opt *.ll -strip-debug > tmp.ll
    geos-best --ll tmp.ll `for i in $(ls *.gcda); do echo -n -ga $i -go ${i:0:-2}no" "; done;` -TTIInstruction -Cache -c callcost -f 1.86 #2> /dev/null
    echo
    #geos-analyser --ll tmp.ll -Branch -c callcost -f 1.86 #2> /dev/null
    rm tmp.ll
    cd ../..
  fi
done
