#!/bin/bash
for ((i=20;i > 0;i--))
{
        if (( i % 2 == 0 ))
        then
       	echo  "$i is divisible by 2"
        fi
}
exit 0


