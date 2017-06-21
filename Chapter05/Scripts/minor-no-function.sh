#!/bin/bash

if (("$1" < "$2"))
   then
	echo "Great! The integer $1 is less than $2"
   else
	echo "The integer $1 is not less than $2..."
fi
