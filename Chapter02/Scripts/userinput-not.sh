#!/bin/bash

echo "Hello user, please give me a number between 10 and 12: "

read user_input

if [ ! ${user_input} -eq 11 ]
   then
	echo "The number ${user_input} is not what we are looking for..."
   else
	echo "Great! The number ${user_input} is what we were looking for!"
fi
