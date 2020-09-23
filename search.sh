#!/bin/bash

if [ -d $1 ]
then
	if [ -r $1 ]
	then
		grep -r "$2" "$1"
	else
		echo "Error: '$1': Read permission denied"
		exit
	fi
else
	echo "Error: '$1': No such directory"
	exit
fi