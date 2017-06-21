#!/bin/bash

counter=10
exit_at=5

while (( $counter > 0 )); 
	do
        echo "Loop number: $((counter--))"
        if (( $counter < $exit_at )); then
           exit 18
        fi
        done
