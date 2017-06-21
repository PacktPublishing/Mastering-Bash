#!/bin/bash

>&2 echo "Hello from the inner script, can you give me an integer between 0 and 9?"
read -s number

case "$number" in
		[[:digit:]] )	
		echo "This is the integer the user gave us: $number"
                exit
		;;
		* )
		# Default catchall option
		echo "The user did not give us an integer between 0 and 9 but this: $number"
                exit
		;;
esac
