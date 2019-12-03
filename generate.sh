#!/bin/bash

grammarinator-generate \
--encoding ascii \
-l fuzzer/CPP14Unlexer.py \
-p fuzzer/CPP14Unparser.py \
-r declarationseq \
-o out/test_%d.cpp \
-t grammarinator.runtime.simple_space_transformer \
-d 30 -n $1

# sed -E 's/\\[Uu]/_u_/g'
echo out/*.cpp | xargs -n1 -P $(nproc) sed -i -E 's/\\[Uu]/_u_/g'
