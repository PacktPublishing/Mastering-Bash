#!/bin/bash

echo "Hello user, please give me an even number: "

read user_input

if ! (( $user_input % 2 )) 
   then
	echo "Great! The number ${user_input} is what we were looking for!"
fi
