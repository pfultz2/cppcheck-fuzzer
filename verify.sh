#!/bin/bash

CPPCHECK=${CPPCHECK:-cppcheck}
CXX=${CXX:-c++}

$CXX -std=gnu++14 -fsyntax-only $1

RES=$?
if [ $RES -ne "0" ]; then
    exit 0
fi

TMPFILE=$(mktemp)

$CPPCHECK --enable=all $1 |& tee $TMPFILE
RES=$?
if [ $RES -ne "0" ]; then
    rm $TMPFILE
    exit 1
fi

grep -q -E "internalAstError|syntaxError" $TMPFILE
RES=$?
if [ $RES -eq "0" ]; then
    rm $TMPFILE
    exit 1
fi

rm $TMPFILE
exit 0
