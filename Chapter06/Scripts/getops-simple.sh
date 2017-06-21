#!/bin/bash

while getopts ":ax:f" option
do
	case $option in
	      a | f)
                    echo "You selected $option!"
                    ;;
                  x)
                    echo "You selected $option with argument $OPTARG"
		    ;;
		 \?)
		    echo "Invalid switch: -$OPTARG"
		    ;;
		 :)
		    echo "No arguments provided: -$OPTARG"
		    ;;
	esac
done
