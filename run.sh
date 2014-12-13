#!/bin/bash

function create-database() {
  echo "Creating database $1 from $2"
  touch $1
  cd database/$2/HDB
  for h in $(ls *); do
    echo $h
    ../../../merge -hs $h -p ../DB/$h -db ../../../$1 >> tmp
    mv tmp ../../../$1
  done;
  cd ../../../
}

function benchmarks-to-llvm() {
  echo "Compiling benchmakrs to LLVM"
  cd benchmarks 
  ./generateLLVMs.sh
  cd ..
}

function feed-database() {
  echo "Getting information to feed a database"
  cd database
  pwd
  ./createDatabase.sh $1
  cd ..
}

function run-all() {
  benchmarks-to-llvm
  feed-database $1
  create-database $1 $1
}

if [[ $# -eq 0 ]] ; then
  echo -e 'Please pass as argument one of this options: \n' \
       '   -create-database name feedName \n' \
       '   -feed-database name\n' \
       '   -benchmarks-to-llvm\n' \
       '   -run-all name'
  exit 0
fi

${1:1} $2 $3
