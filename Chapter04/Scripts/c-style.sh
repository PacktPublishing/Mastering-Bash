#!/bin/bash

x=20
y=30
w=40
z=50
k=100

echo 'Usually you would write a control loop in the following way:'
echo 'if [[ $x -gt $y ]]'
echo '   then'
echo '      z="$w"' 
echo '      echo "The value for z is: "$z""' 
echo '   else'
echo '      z="$k"' 
echo '      echo "The value for z is: "$z""' 
echo 'fi'
if [[ $x -gt $y ]]
   then
      z="$w"
      echo "The value for z is: "$z""
   else
      z="$k"
      echo "The value for z is: "$z""
fi
echo 'But you can also use the C-style trinary operator to achieve the same result:'
echo '(( z = $x>$y?$w:$k ))'
echo 'echo "The value for z is: $z"'
(( z = $x>$y?$w:$k ))
echo "The value for z is: $z"
