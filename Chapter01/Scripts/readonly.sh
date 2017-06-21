#!/bin/bash

echo "What is our PATH?"
echo ${PATH}

echo "Now we make it readonly"
readonly PATH

echo "Now  we expand the path for all the shell"
export PATH=${PATH}:~/tmp

