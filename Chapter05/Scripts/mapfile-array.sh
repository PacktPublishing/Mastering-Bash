#!/bin/bash

declare -a friends
echo -e
echo -e "Reading friends list from friends.txt file..."
mapfile friends < friends.txt
echo -e "File content loaded!"
echo -e "So, your friends are: \n${friends[@]}"
