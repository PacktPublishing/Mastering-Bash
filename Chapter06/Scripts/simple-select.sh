#!/bin/bash

PS3="Your choice is: "

echo "Just select the fruit you like:"

select fruit in apple banana orange mango
do
	     echo "You picked $fruit (Option $REPLY)"
done
