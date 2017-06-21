#!/bin/bash

echo "Hello user, please give me a number: "

read user_input

echo "And now another one, please: "

read adding

echo "The user_input variable value is: ${user_input}"
echo "The adding variable value is: ${adding}"
echo "${user_input} subtracted of ${adding} is: $((user_input-=adding))"
echo "And the user_input variable has now  the value of ${user_input}"
echo "But the adding variable has still the value of ${adding}"
