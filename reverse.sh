#!/bin/bash

if [ -e $1 ]
then
	if [ -r $1 ]
	then
		if [ -s $1 ]
		then
			if [ -e $2 ]
			then
				if [[ -d $2 || -d $1 ]]
				then
					echo "Error: it's a directory"
					exit 2
				fi
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
					echo "Error: no write permission"
					exit 3
				fi
			else
				if ! touch "$2" 2>/dev/null
				then
					echo "Error: no permission to create the file here"
					exit 4
				else
					touch "$2"
					rev $1 | tac >$2
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
