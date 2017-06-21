#!/bin/bash

x=10
echo "The initial value of x is: $x"
multiplier () {
local y=$(( $x*$x )) 
echo "The value of y in the function is: $y"
}
echo "We now trigger the function..."
multiplier
echo "The value of y right after the function execution is: $y"
{ z=$(( $x*$x )) ; 
echo "The value of z in the function is: $z" ; }
echo "The value of z right after the function execution is: $z"
