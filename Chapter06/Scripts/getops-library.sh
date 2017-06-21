#!/bin/bash

source library.lib

non_zero_input "$#"

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
echo $*
echo -e "${Green}But${CReset} at the end of the script we have this left on the command line: ${Red}$@${CReset}"
color_print ${Yellow} "But we can use our color_print function to have a fancy output: $*"
