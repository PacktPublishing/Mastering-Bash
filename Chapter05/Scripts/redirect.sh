#!/bin/bash

file=friends.txt

parse()
{
	while read lineofile
	do
		echo $lineofile
	done
}<$file
parse

