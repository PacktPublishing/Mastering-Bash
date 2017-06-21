#!/bin/bash

echo "Hello user, please type a string and press enter:"
read user_input1 
echo "Now type another string and press enter:"
read user_input2 
if [[ ${user_input1} > ${user_input2} ]]
   then
	echo "Great! The string ${user_input1} is greater than ${user_input2}"
   else
	echo "The string ${user_input1} is not greater than ${user_input2}..."
fi
