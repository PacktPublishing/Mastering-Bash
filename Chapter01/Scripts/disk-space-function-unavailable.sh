#!/bin/bash

echo -e "\n"

echo "The space left is ${disk_space}"

disk_space=`df -h | grep vg-root | awk '{print $4}'`

print () {

echo "The space left inside the function is ${disk_space}"

local available=yes
last=yes

echo "Is the available variable available inside the function? ${available}"

}

echo "Is the last variable available outside the function before it is invoked? ${last}"
print
echo "The space left outside is ${disk_space}"
echo "Is the available variable available outside the function? ${available}"
echo "Is the last variable available outside the function after it is invoked? ${last}"

echo "What happens if we unset a variable, like last?"
unset last
echo "Has last a referrable value ${last}"

echo "And what happens if I try to unset a while print functions using  unset -f"

print

unset -f print

echo "Unset done, now  let us invoke the function"

print
