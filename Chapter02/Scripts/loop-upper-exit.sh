#!/bin/bash

counter=10

while [ $counter -gt 0 ]; 
	do
	exit 20
        echo "Loop number: $((counter--))"
        done
