#!/bin/bash

a=10

echo "The value of a in the main subshell is $a"
(echo "The value of a in the child subshell is $a"; echo "...but now it changes"...; a=20; echo "and now a is $a")
echo "But coming back to the main subshell, the value of a has not been altered here since the subshell variables are local, a: $a"
