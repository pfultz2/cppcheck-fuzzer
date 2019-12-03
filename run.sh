#!/bin/bash

export FAIL_DIR=$(pwd)/fail/
mkdir -p $FAIL_DIR
rm out/*.cpp
./generate.sh $1
echo out/*.cpp | xargs -t -n1 -P $(nproc) ./check-fail.sh
