#!/bin/bash

check () {
	if [[ "$1" != "calc" && "$1" != "search" && "$1" != "reverse" && "$1" != "strlen" && "$1" != "log"
	&& "$1" != "exit" && "$1" != "help" && "$1" != "interactive" ]]
	then
		echo "Error: No such function. Please check the 1st argument."
		exit 0
	fi
}

check $1

case $1 in
calc)
	if [ $# == 4 ]
	then
		./myfunc.sh $2 $3 $4
	else
		echo "Error: Expected 4 arguments."
		exit
	fi
;;
search)
	if [ $# == 3 ]
	then
		./search.sh $2 $3
	else
		echo "Error: Expected 3 arguments."
		exit
	fi
;;
reverse)
	if [ $# == 3 ]
	then
		./reverse.sh $2 $3
	else
		echo "Error: Expected 3 arguments."
		exit
	fi
;;
strlen)
	if [ $# == 2 ]
	then
		shift
		./length.sh "$@"
	else
		echo "Error: Expected 2 arguments."
		exit
	fi
;;
log)
	if [ $# == 1 ]
	then
		./log.sh
	else
		echo "Error: Expected 1 argument."
		exit
	fi
;;
exit)
	if [ $# == 2 ]
	then
		./ex.sh $2
	else
		exit 0
	fi
;;

help)
	if [ $# == 1 ]
	then
		cat help.txt
	else
		echo "Error: Expected 1 argument."
		exit
	fi
;;

interactive)
	if [ $# == 1 ]
	then
		exec sh ./interactive.sh
	else
		echo "Error: Expected 1 argument."
		exit
	fi
;;
esac
