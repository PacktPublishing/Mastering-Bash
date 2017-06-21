#!/bin/bash

echo -e "\n"

echo "The space left is ${disk_space}"

disk_space=`df -h | grep /dm-0 | awk '{print $4}'`

echo "The space left is ${disk_space}"
