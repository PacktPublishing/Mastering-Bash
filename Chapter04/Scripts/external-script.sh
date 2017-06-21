#!/bin/bash

echo "Hello from the inner script, can you give me a number?"
read number

case "$number" in
	[[:digit:]] )	
		echo "$number is a digit!"
		exit 0
		;;
		* )
		# Default catchall option
		echo "Sorry, $number is not a digit"
		exit 1
		;;
esac
