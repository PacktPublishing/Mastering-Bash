#!/bin/bash

echo "Hello user, please give me a number: "

read user_input

echo "And now another one, please: "

read adding

addition=$((user_input+adding))

echo "The number is: ${user_input:-99}"
echo "The number added of ${adding} is: ${addition}"
