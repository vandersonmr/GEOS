#!/bin/bash

for i in `ls gcovs/`; do
  cd gcovs/$i
  echo -n $i " "
  geos-analyser --ll *.ll `for i in $(ls *.gcda); do echo -n -ga $i -go ${i:0:-2}no" "; done;` $1 -f 1.86 -db ../../../database/xeon/db 2> /dev/null
  cd ../..
done
