#!/bin/bash

declare -a my_array
my_array=("one" "two" "three" "four" "five")
for i in ${my_array[*]} ; 
do 
	echo "$i" 
done
