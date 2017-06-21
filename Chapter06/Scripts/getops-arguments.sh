#!/bin/bash

if (( $# == 0 ))
then 
	echo "Please, give at least one option on the command line"
        exit 1
fi
while getopts ":ax:f" option
do
	case $option in
	      a | f)
                    echo "You selected $option with \$OPTIND=$OPTIND and the command line argument $*!"
                    ;;
                  x)
                    echo "You selected $option with argument $OPTARG with \$OPTIND=$OPTIND and the command line $*!"
		    ;;
		 \?)
		    echo "Invalid switch: -$OPTARG with \$OPTIND=$OPTIND"
		    ;;
		 :)
		    echo "No arguments provided: -$OPTARG with \$OPTIND=$OPTIND"
		    ;;
	esac
done
echo "\$OPTIND at the end of the loop is $OPTIND"
shift "$((OPTIND-1))"
echo "But at the end of the script we have this left on the command line: $*"
