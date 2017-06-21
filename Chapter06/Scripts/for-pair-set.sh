#!/bin/bash

for cities in "Belfast UK" "Redwood USA" "Milan ITALY" "Paris FRANCE"
do
	set -- $cities
	echo "$1 is in $2"
done
exit 0
