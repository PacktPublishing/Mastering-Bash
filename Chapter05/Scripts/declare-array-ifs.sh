#!/bin/bash

declare -a friends
clear
echo -n "Can you please tell me the name of some of your friends: "
read -a friends
echo "So, your friends are: ${friends[@]}"

