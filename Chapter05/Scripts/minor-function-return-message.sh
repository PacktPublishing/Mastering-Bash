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

message=$(minor "$1" "$2")
echo "$message"
