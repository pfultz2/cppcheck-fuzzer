#!/bin/bash

./verify.sh $1
RES=$?
if [ $RES -ne "0" ]; then
    cp $1 $FAIL_DIR/failed_$(md5sum $1)_$(uuid).cpp
fi
