#!/bin/bash

echo "Hello user, please type in one integer and press enter:"
read user_input1 
echo "Now type in the number again and press enter:"
read user_input2 
if [ ${user_input1} -ge ${user_input2} ]
   then
	echo "Great! The integer ${user_input1} is greater than or equal to ${user_input2}"
   else
	echo "The integer ${user_input1} is not greater than or equal to ${user_input2}..."
fi
