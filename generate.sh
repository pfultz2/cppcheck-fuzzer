#!/bin/bash

mkdir -p tree/

grammarinator-generate \
-l fuzzer/CPP14CustomUnlexer.py \
-p fuzzer/CPP14CustomUnparser.py \
--population tree/ \
-r translationunit \
-o out/test_%d.cpp \
-t grammarinator.runtime.simple_space_transformer \
-d 10 -n $1

echo out/*.cpp | xargs -n1 -P $(nproc) sed -i -E 's/\\[Uu]/_u_/g'
echo out/*.cpp | xargs -n1 -P $(nproc) sed -i -E 's/\w"/"/g'
# Remove non-ascii characters
LANG=C
echo out/*.cpp | xargs -n1 -P $(nproc) sed -i 's/[\d128-\d255]/_u_/g'
