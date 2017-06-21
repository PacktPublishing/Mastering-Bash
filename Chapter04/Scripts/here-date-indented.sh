#!/bin/bash

cat <<- DELIMITER
This is a string
	followed by an indented one  
		with an indented date: $(date +%Y.%m.%d)
until the 
DELIMITER
