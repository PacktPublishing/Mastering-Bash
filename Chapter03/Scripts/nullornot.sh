#!/bin/bash

echo "Hello user, please type a string and press enter:"
read user_input1 
if [ -n ${user_input1} ]
   then
	echo "Great! The string ${user_input1} is not null"
   else
	echo "The string ${user_input1} is null..."
fi
echo "But look at this..."

if [ -n ${user_input2} ]
   then
	echo "Great! The string ${user_input2} is not null"
   else
	echo "The string ${user_input2} is null..."
fi

echo "And now at this..."

if [ -n "${user_input2}" ]
   then
	echo "Great! The string ${user_input2} is not null"
   else
	echo "The string ${user_input2} is null..."
fi
