#!/bin/bash

minor()
{
if (("$1" < "$2"))
then
   	echo "Great! The integer $1 is less than $2"
	echo "Assigning S1 to the variable \"var\""
	local var="$1"
	echo "The value of var inside the function is: $var"
else
   	echo "The integer $1 is not less than $2..."
fi
}

echo "The value of var outside the function before it is triggered is: $var"

minor "$1" "$2"

echo "The value of var outside the function after it is triggered is: $var"
