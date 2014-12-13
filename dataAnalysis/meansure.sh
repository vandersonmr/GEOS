#!/bin/bash

function execution-time() {
  mkdir -p tmp
  cd tmp

  if [[ -d ../$1 ]]; then
    cp ../$1/* .
  else
    cp ../$1 .
  fi

  clang --coverage -O0 *.ll -lm -ldl 2> /dev/null
  name=${1}
  echo "$name" > stamp
  TIMEFORMAT='%3U'; (time ./a.out &> /dev/null) &>> stamp
  llvm-link-3.5 *.ll -S > linked.ll
  cd ..
  ../analyser `for i in $(ls tmp/*.gcda); do echo "-ga $i"; done` \
              `for i in $(ls tmp/*.gcno); do echo "-go $i"; done` \
              -ll tmp/linked.ll -hashM -db ../database/intel-i5/data \
              2> /dev/null >> tmp/stamp
  cat tmp/stamp | sed ':a;N;$!ba;s/\n/\t/g'
  rm -r tmp
}

if [[ $# -eq 0 ]] ; then
  echo -e 'Please pass as argument one of this options: \n' \
    ' -execution-time llvmFile \n'
  exit 0
fi

${1:1} $2
