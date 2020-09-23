#!/bin/bash

check_directory_exists ()
{
	if [ -d "$1" ]
	then
		echo "return 1"
		return 1
	else
		echo "Error: No '$1' directory found"
		return -1
	fi
}

check_file_exists ()
{
	if ! [ -f "$1" ]
	then
		echo "Error: No '$1' file found"
		return -1
	else
		return 2
	fi
}

check_read_file ()
{
	if ! [ -r "$1" ]
	then
		echo "Error:'$1': Read permission denied"
		return -1
	else
		return 3
	fi
}

check_write_file ()
{
	if ! [ -w "$1" ]
	then
		echo "Error:'$1': Write permission denied"
		return -1
	else
		return 4
	fi
}
