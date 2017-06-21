#!/bin/bash

echo "We now source external-data file and get the variables content"
echo ". external-data"
. external-data
echo "Now that we sourced the external file, we have access to variables content"
echo "The content of var1 is: "${var1}"
echo "The content of var2 is: "${var2}"
