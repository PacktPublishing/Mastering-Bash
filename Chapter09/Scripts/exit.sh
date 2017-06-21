#!/bin/bash
echo "This is the main subshell"
(
echo "This is the second level subshell";
for i in {1..10}; do if (( i==5 )); then exit; else echo $i; fi; done
)	
echo "Out of the second level subshell but still kicking inside the first level!"
for i in {1..3}
do echo $i
done
