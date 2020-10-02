#!/bin/bash

if [ -e $1 ]
then
	if [ -r $1 ]
	then
		if [ -s $1 ]
		then
			if [ -e $2 ]
			then
				if [ -w $2 ]
				then
					if [ "$1" == "$2" ]
					then
						rev $1 | tac >TMP
						mv TMP "$2"
					else
						rev $1 | tac >$2
					fi
				else
					echo "Error: write permission denied :("
					exit 3
				fi
			else
				if [[ -w $2 && -r $2 ]]
				then
					touch "$2"
					rev $1 | tac >$2
				else
					echo "Error: no read or write permission"
					exit 4
				fi
			fi
		else
			echo "Error: File '$1' is empty"
			exit 5
		fi
	else
		echo "Error: '$1': Read permission denied"
		exit 6
	fi
else
	echo "Error: '$1': No such file found"
	exit 7
fi
