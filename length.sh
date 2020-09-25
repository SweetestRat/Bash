#!/bin/bash

if [ -z $1 ]
then
        echo "Zero string. Length = 0."
        exit
else
        str="$@"
        echo ${#str}
fi
