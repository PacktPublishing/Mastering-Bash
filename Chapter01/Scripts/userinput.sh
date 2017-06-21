#!/bin/bash

echo "Hello user, please give me a number: "

read user_input

echo "The number is: ${user_input:-99}"
