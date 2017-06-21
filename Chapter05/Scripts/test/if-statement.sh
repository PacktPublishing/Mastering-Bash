#!/bin/bash

echo "Please, give me some input"
read input
if [[ $input =~ ^[[:digit:]]+$ ]]; 
	then
		echo "These are digits"
		exit 0
elif [[ $input =~ ^[[:alpha:]]+$ ]]; 
	then
		echo "These are chars"
		exit 0
	else
		echo "Dunno..."
		exit 1
fi
