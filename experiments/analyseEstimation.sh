#!/bin/bash

for i in `ls gcovs/`; do
  cd gcovs/$i
  echo -n $i " "
  opt *.ll -strip-debug > tmp.ll
  #geos-analyser --ll tmp.ll `for i in $(ls *.gcda); do echo -n -ga $i -go ${i:0:-2}no" "; done;` -Branch -c callcost -f 1.86 #2> /dev/null
  geos-analyser --ll tmp.ll -Branch -c callcost -f 1.86 #2> /dev/null
  rm tmp.ll
  cd ../..
done
