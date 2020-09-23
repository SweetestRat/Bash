#!/bin/bash

is_numeric='^[+-]?[0-9]+$'

if [[ $1 =~ $is_numeric ]]
then
	if (( $1 >= 0 )) && (( $1 <= 9 ))
	then
		exit $1
	else
		echo "Error: $1 is not in range [0:9]"
		exit
	fi
else
	echo "Error: exit code is not numeric"
	exit
fi