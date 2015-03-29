#!/bin/bash

mkdir -p res
for file in $(ls ./benchmarks/llvm/*.o0 -d); do
  echo ${file:18}

  mkdir -p res/${file:18}/
  llvm-link $file/*.ll > res/${file:18}/${file:18}.bc
  opt -strip-debug res/${file:18}/${file:18}.bc > tmp
  mv tmp res/${file:18}/${file:18}.bc

done;

cd res/
for i in $(ls -d ../gcovs/*.o0); do 
  cp $i/*.gc* ./${i:9}/
done;

parallel --gnu 'cd {};
  echo {};
  mkdir -p 1;
  cd 1;
  geos-fixed -ll ../*.bc `for h in $(ls ../*.gcda); do echo -n -ga $h -go ${h:0:-2}no" "; done;` \
    -db ../../../../database/xeon/db -hashPlusInstM -f 1.86 2> /dev/null | tee saida;
   cd ..;
  cd ..;' ::: *

cd ../
