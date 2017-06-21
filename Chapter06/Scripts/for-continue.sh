#!/bin/bash

for i in {0..10}
do
	if (( i == 4 ))
	then
	continue
	else
		echo $i
	fi
done
exit 0
