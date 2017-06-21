#!/bin/bash

declare -A friends
friends=([Mike]="is a friend" [Anthony]="is another friend")
echo "The lenght of \"${friends[Anthony]}\" is ${#friends[Anthony]}"
