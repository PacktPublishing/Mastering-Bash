#!/bin/bash

x=0
while true
do
	for i in {1..1000}
	do
		x="$i"
		if (( x == 500 ))
		then
			echo "The value of x is: $x" >> write.log
		fi
	done
done
