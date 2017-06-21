#!/bin/bash

declare -A friends
clear
echo -n "Can you please tell me the name of one of your friends: "
read name
if [[ -z "$name" ]]
then
	echo "The name value cannot be blank"
	exit 1
fi
echo -n "And now his email address: "
read address
friends[$name]=${address}
echo -e "So, your friend name is:  ${!friends[@]}\nHis email address is:     ${friends[@]}"

