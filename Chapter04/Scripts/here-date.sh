#!/bin/bash

cat << DELIMITER
This is a string
followed by another
date $(date +%Y.%m.%d)
until the 
DELIMITER
