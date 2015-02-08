#!/bin/bash

mkdir -p gcovs
#parallel --gnu 'echo Compiling {/}; mkdir -p gcovs/{/}; cd gcovs/{/}; clang ../../{}/*.ll --coverage -g -O0 -lm -ldl -o {/} 2> /dev/null; cd ../../' ::: ../benchmarks/llvm/*/
#parallel --gnu 'echo Chmoding {1}; chmod +x ./{1}/{/};' ::: gcovs/*/
parallel --gnu 'echo Linking {1}; llvm-link {}/*.ll -o gcovs/{/}/{/}.ll;' ::: ../benchmarks/llvm/*/
parallel --gnu 'echo Exec {1}; ./{1}/{/};' ::: gcovs/*/
rm *.ll
