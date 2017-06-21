#!/bin/bash

echo "We are into the directory" 
pwd

echo "What is our PATH?"
echo ${PATH}

echo "Now  we expand the path for all the shell"
export PATH=${PATH}:/tmp

echo "And now our PATH is..."
echo ${PATH}

echo "Time for magic!"
env PATH=/usr/bin which setting.sh
echo "BOOOO, nothing!"

echo "Second try..."
env PATH=/usr/sbin which setting.sh
