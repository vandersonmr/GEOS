#!/bin/bash

cd $1

for i in $(ls); do
  cd $i/1
  cat saida | tail -n1 | cut -d':' -f2
  cd ../..
done
