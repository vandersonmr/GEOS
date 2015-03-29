#!/bin/bash

mkdir -p llvm
cd src
for folder in $(ls -d */); do
  cd $folder
  ./compile.sh
  cp -r llvm/* ../../llvm/
  cd ..
done
