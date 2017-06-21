#!/bin/bash

declare -a my_array
my_array=("one" "two" "three" "four" "five")
for (( i=0 ; i<${#my_array[*]} ; i++ ));
do 
	echo "${my_array[i]}" 
done
