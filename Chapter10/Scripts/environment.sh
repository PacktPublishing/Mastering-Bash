#!/bin/bash

a=10
b=20

echo -e "\n"
echo "This is the value of a in the main subshell: $a"
(a=$((a+b)) ; echo "Inside the nested subshell a now has the value of: $a")
echo "Back to the main subshell a has a value of: $a"

echo -e "\n"

echo "And now we will tinker with the environment..."
echo "This is the value of a in the main subshell: $a"
(
export a=$((a+b)) 
b=$((a+b)) 
echo "Inside the nested subshell a now has the value of: $a" 
echo "Inside the nested subshell b now has the value of: $b" 
echo "The value of the environment variable a is:"
env | grep ^a
echo "Here is the value of a at this level of subshell using process substitution:"
grep ^a <(env)
echo "And they are the same, since the nested shell share the environment variables of the parent shell"
echo "b is inherited as well: $b"
)
echo "Back to the main subshell the environment variable a has a value of: $a"
echo "Back to the main subshell the shell variable b has a value of: $b"

