#!/bin/bash
menu ()
{
echo -e "\e[1;36mHerzlish Willkomen!"
echo -e "Here you can choose any following command you want:\e[0m"
echo -e "\e[1;31mPlease enter the number or the name of the command\e[0m"
echo -e "\e[1;33m1. calc"
echo -e "2. search"
echo -e "3. reverse"
echo -e "4. strlen"
echo -e "5. log"
echo -e "6. exit"
echo -e "7. help"
echo -e "8.interactive\e[0m"
echo -e "\e[1;31mPress x to quit.\e[0m"
}

error ()
{
	echo "No access"
}

calc ()
{
if [[ -e ./myfunc.sh ]]
then
	echo -e "\e[1;33mEnter 3 arguments:"
	echo -e "1. sum / sub / mul /div"
	echo -e "2 & 3. integer numbers"
	echo -e "command number1 number 2\e[0m"
	read command num1 num2
	./myfunc.sh $command $num1 $num2
else
	error
fi
}

search ()
{
if [[ -e ./search.sh ]]
then
	echo -e "\e[1;33mEnter 2 arguments:"
	echo -e "1. directiry name"
	echo -e "2. regular expression you want to find"
	echo -e "directory expression\e[0m"
	read directory expression
	./search.sh $directory $expression
else
	error
fi
}

reverse ()
{
if [[ -e ./reverse.sh ]]
then
	echo -e "\e[1;33mEnter 2 arguments:"
	echo -e "1. input file (preferably with text in it)))"
	echo -e "2. output file (where to reverse the text)"
	echo -e "input output\e[0m"
	read input output
	./reverse.sh $input $output
else
	error
fi
}

strlen ()
{
if [[ -e ./length.sh ]]
then
	echo -e "\e[1;33mEnter 1 argument:"
	echo -e "1. 'string'\e[0m"
	read str
	./length.sh $str
else
	error
fi
}

log ()
{
if [[ -e /var/log/anaconda/X.log ]]
then
	./log.sh
else
	error
fi
}

ex ()
{
if [[ -e ./ex.sh ]]
then
	echo -e "\e[1;33mEnter 1 argument or enter y to exit without exit code"
	echo -e "1. exit code or y\e[0m"
	read ex
	if [[ -z "$ex" ]]
	then
		exit 0
	else
		exec sh ./ex.sh $ex
	fi
else
	error
fi
}

help ()
{
if [[ -e ./help.txt ]]
then
	cat help.txt
else
	error
fi
}

interactive ()
{
if [[ -e ./interactive.sh ]]
then
	./interactive.sh
else
	error
fi
}

while true
do
	menu
	read command
	if [[ $command == "1" ]] || [[ $command == "calc" ]] || [[ $command == "1. calc" ]]
	then
		calc
	else if [[ $command == "2" ]] || [[ $command == "search" ]] || [[ $command == "2. search" ]]
	then
		search
	else if [[ $command == "3" ]] || [[ $command == "reverse" ]] || [[ $command == "3. reverse" ]]
	then
		reverse
	else if [[ $command == "4" ]] || [[ $command == "strlen" ]] || [[ $command == "4. strlen" ]]
	then
		strlen
	else if [[ $command == "5" ]] || [[ $command == "log" ]] || [[ $command == "5. log" ]]
	then
		log
	else if [[ $command == "6" ]] || [[ $command == "exit" ]] || [[ $command == "6. exit" ]]
	then
		ex
	else if [[ $command == "7" ]] || [[ $command == "help" ]] || [[ $command == "7. help" ]]
	then
		help
	else if [[ $command == "8" ]] || [[ $command == "interactive" ]] || [[ $command == "8. interactive" ]]
	then
		interactive
	else if [[ $command == "x" ]] || [[ $command == "quit" ]]
	then
		exit
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
done
