#!/bin/bash -x

y=0

clean_exit()
{
echo "ouch, we received a TERM signal. Outta here but first a bit of cleaning"
rm write.log
exit 0
}

trap 'clean_exit' INT
trap '' TERM 

for i in {1..3}
	do
		x="$i"
		if (( x == 3 ))
		y="$x"
		then
			echo "The value of x is: $x" >> write.log
		fi
			trap 'echo "The value of \$y is \"${y}\""' DEBUG
done
