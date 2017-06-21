#!/bin/sh

echo "We are going to test for files test1 test2 test3"

if ls test1
then
echo "File test1 exists so the ls test1 execution returns $?"
elif ls test2
then
echo "File test2 exists so the ls test2 execution retuns $?"
elif ! ls test3
then
echo "File test3 exists so the ls test3 execution retuns $?"
else
:
fi
