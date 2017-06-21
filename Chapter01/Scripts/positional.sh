#!/bin/bash

fistvariable=${1}
secondvariable=${2}
thirdvariable=${3}
eleventhvariable=${11}
export IFS=*

echo "The value of the first variable is ${fistvariable}, the second is ${secondvariable}, the third is ${thirdvariable}, the eleventh is ${eleventhvariable}"

echo "The full path to the script is $0"

echo "We passed ${#} arguments to the script"

echo "This is the list of the arguments ${@}"
echo "This too is the list of the arguments ${*}"
IFS=
echo "This too is the list of the arguments ${*}"

echo "The process id of this script is ${$}"
echo "The background process id of this script is ${!}"
echo "Executing a ps in background"
nohup ps &
echo "The background process id of this script is ${!}"
