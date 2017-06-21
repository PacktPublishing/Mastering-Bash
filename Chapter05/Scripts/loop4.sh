#!/bin/bash

declare -A friends
friends=([Mike]="is a friend" [Anthony]="is another friend")
indexes=(${!friends[*]})
for ((i=0 ; i<${#friends[*]} ; i++));
do 
	echo "${indexes[i]} - ${friends[${indexes[i]}]}"
done
