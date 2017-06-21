#!/bin/sh

clear
echo "Please choose between these options:"
echo "ls for listing files"
echo "procs for listing processes"
echo "x for exit"
read input

case "$input" in
	"ls" | "LS")
		echo "Listing files:"
		ls
		exit 0
		;;
	"procs" | "PROCS")
		echo "Listing processes:"
		ps
		exit 0
		;;
		"x" | "X" )
		echo "exiting"
		exit 0
		;;
		*)
		# Default catchall option
		echo "exiting"
		exit 0
		;;
esac
