#!/bin/bash

counter=0
echo "First trying the \$*"
for i in "$*"
do
        (( counter+=1 ))
	echo $counter
done

counter=0
echo "And now \$@"
for i in "$@"
do
        (( counter+=1 ))
	echo $counter
done
