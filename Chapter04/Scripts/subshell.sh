#!/bin/bash

x=10
echo "The initial value of x is: $x"
(x=$(( $x*$x )) ; echo "The value of x is: $x")
echo "But outside the subshell the value of x is untouched: $x" 
