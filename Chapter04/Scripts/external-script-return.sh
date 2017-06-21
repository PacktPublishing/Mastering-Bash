#!/bin/bash

echo "Hello from the inner script, can you give me an integer between 0 and 9?"
read number

case "$number" in
	[[:digit:]] )	
		return 0
		;;
		* )
		# Default catchall option
		return 1
		;;
esac
