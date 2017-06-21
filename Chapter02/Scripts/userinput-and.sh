#!/bin/bash

echo "Hello user, please give me a number between 10 and 20 or between 50 and 10: "

read user_input

if [[ ${user_input} -ge 10 && ${user_input} -le 20 ]] || [[ ${user_input} -ge 50 && ${user_input} -le 100 ]]
   then
	echo "Great! The number ${user_input} is what we were looking for!"
   else
	echo "The number ${user_input} is not what we are looking for..."
fi
