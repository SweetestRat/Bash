#!/bin/bash

if [ -e $1 ]
then
	if [ -r $1 ]
	then
		if [ -s $1 ]
		then
			if [ -e $2 ]
			then
				rev $1 | tac >$2
			else
				touch "$2"
				rev $1 | tac >$2
			fi
		else
			echo "Error: File '$1' is empty"
			exit
		fi
	else
		echo "Error: '$1': Read permission denied"
		exit
	fi
else
	echo "Error: '$1': No such file found"
	exit
fi
