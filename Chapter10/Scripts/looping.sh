#!/bin/bash
main_variable=10

echo "We are outside the loop and the global variable called main_variable has a value of: $main_variable"

for i in {1..5}
do 
	echo "$i" 
done |
 
while read j
do

	main_variable="$j"
	echo "We are inside the loop and main_variable has a value of: $main_variable"
done
echo "We are now past the loop and main_variable has a value of: $main_variable"
