#!/bin/bash

x=0

clean_exit()
{
echo "ouch, we received a TERM signal. Outta here but first a bit of cleaning"
rm write.log
exit 0
}

trap 'clean_exit' INT
trap '' TERM 

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
