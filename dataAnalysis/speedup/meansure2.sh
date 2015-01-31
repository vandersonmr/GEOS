#!/bin/bash

function execution-time() {
  name=${1:19}
  tmp=tmp/$name
  ../analyser `for i in $(ls $tmp/*.gcda); do echo "-ga $i"; done` \
              `for i in $(ls $tmp/*.gcno); do echo "-go $i"; done` \
              -ll $tmp/linked.ll -profM -db ../database/intel-i5/DB/$name \
              2> /dev/null > $tmp/stamp

  cat $tmp/stamp | sed ':a;N;$!ba;s/\n/\t/g'
  #rm -r tmp
}

touch table;
for i in $(ls -d ../benchmarks/llvm/*); do
  if [[ -d $i ]]; then
    echo $i
  else
    echo $i
    execution-time $i >> table3
  fi
done
echo "Done"


