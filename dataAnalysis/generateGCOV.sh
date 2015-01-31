#!/bin/bash

mkdir -p gcovs
parallel --gnu 'echo Compiling {/}; mkdir -p gcovs/{/}; cd gcovs/{/}; clang ../../{} --coverage -g -O0 -lm -ldl -o {/} 2> /dev/null; cd ../../' ::: ../benchmarks/llvm/*/*.ll
parallel --gnu 'echo Chmoding {1}; chmod +x {1};' ::: gcovs/*/*.ll
parallel --gnu 'echo Exec {1}; ./{1};' ::: gcovs/*/*.ll
rm *.ll

