#!/bin/bash
IFS=","
TMOUT=3

declare friends
clear
echo -n "Can you please tell me the name of some of your friends: "
read -a friends
if [ ${#friends[@]} -eq 0 ]
then
	echo "You did not provide me with any names"
	exit 1
else
	echo "So, your friends are: "
	for i in ${!friends[*]}
		do 
		echo "$i - ${friends[$i]}"
	done
fi
exit 0
