#!/bin/bash

echo "Please, give me some input"
read input

case ${input//[[:alpha:]]} in

		   "") 
			echo "There were alphabetic chars only" 
			exit 0
			;;
	*[[:alnum:]]*) 
			echo "There were digits in the string"
			exit 0
			;;
	 	    *) 
			echo "There were non alphanumeric chars" 
			exiit 1
			;;
 esac
