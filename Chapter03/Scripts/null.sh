#!/bin/bash

echo "Hello user, please type a string and press enter:"
read user_input1 
if [[ -z ${user_input1} ]]
   then
	echo "Great! The string ${user_input1} is null"
   else
	echo "The string ${user_input1} is not null..."
fi
