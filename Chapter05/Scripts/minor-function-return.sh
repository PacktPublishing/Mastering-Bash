#!/bin/bash

OK=10
NOT_OK=50

minor()
{
if (("$1" < "$2"))
then
	echo "Returning the value of OK"
	return "$OK"
else
	echo "Returning the value of NOT_OK"
	return "$NOT_OK"
fi
}

print_return()
{
if (("$3" == "$OK")) ; then
   	echo "Great! The integer $1 is less than $2"
	exit 0
elif (("$3" == "$NOT_OK")) ; then
   	echo "The integer $1 is not less than $2..."
	exit 1
else
	echo "Something gone wild..."
   	echo "The first integer has the value of $1 and the second of $2..."
	exit 1
fi    	
}
minor "$1" "$2"
print_return "$1" "$2" "$?"
