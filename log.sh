#!/bin/bash

if [ -e "/var/log/anaconda/X.log" ]
then
	if [ -r "/var/log/anaconda/X.log" ]
	then
		while read line
		do
			if [[ "$line" == *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
			then
				echo -e ${line//"(WW)"/"\e[1;33mWarning:\e[0m"}
			fi
		done < "/var/log/anaconda/X.log"

		while read line
		do
			if [[ "$line" == *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
			then
				echo -e ${line//"(II)"/"\e[1;36mInformation:\e[0m"}
			fi
		done < "/var/log/anaconda/X.log"
	else
		echo "Error: Read permission denied."
		exit 6
	fi
else
	echo "Error: No such file or directory."
	exit 7
fi
