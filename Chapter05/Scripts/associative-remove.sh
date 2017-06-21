#!/bin/bash

declare -A friends
friends=([Mike]="is a friend" [Anthony]="is another friend")
friends=()
for i in Mike Anthony
do 
	echo "$i - ${friends[$i]}"
done
