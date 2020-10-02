#!/bin/bash

if [ -d $1 ]
then
	if [ -r $1 ]
	then
		grep -r -s "$2" "$1"
	else
		echo "Error: '$1': Read permission denied"
		exit 6
	fi
else
	echo "Error: '$1': No such directory"
	exit 7
fi
