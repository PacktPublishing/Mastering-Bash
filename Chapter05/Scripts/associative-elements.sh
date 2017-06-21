#!/bin/bash

declare -A friends
friends=([Mike]="is a friend" [Anthony]="is another friend")
echo "We have ${#friends[@]} elements in the array"
