#!/bin/bash

is_numeric='^[+-]?[0-9]+$'

isnotnull_num='^-?[1-9][0-9]*$'

if [[ $2 =~ $is_numeric ]]
then
	if [[ $3 =~ $is_numeric ]]
	then
		if [[ "$1" != "sum" && "$1" != "sub" && "$1" != "mul" && "$1" != "div" ]]
		then
			echo "Error: No such function. Please check the 2nd argument."
			exit 2
		fi

		case $1 in
		sum)
			res=$(($2 + $3))
			echo $res
		;;
		sub)
			res=$(($2 - $3))
			echo $res
		;;
		mul)
			res=$(($2 * $3))
			echo $res
		;;
		div)
			if ! [[ $3 =~ $isnotnull_num ]]
			then
				echo "Error: cannot divide by zero."
				exit 1
			else
				res=$(($2 / $3))
				echo $res
			fi
		;;
		esac
	else
		echo "Error: 4th argument is not numeric. Expected a number."
		exit 4
	fi
	else
		echo "Error: 3rd argument is not numeric. Expected a number."
		exit 3
fi
