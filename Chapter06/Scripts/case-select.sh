#!/bin/bash

PS3="Your choice is: "

echo "Just select the fruit you like:"

select fruit in apple banana orange mango
do
	case "$fruit" in
		  mango)
		  	echo "You chose $fruit, so we wanna break free!"
		  	break
		  	;;
		  *)
		  	echo "You chose $fruit"
		  	;;
	esac
done
