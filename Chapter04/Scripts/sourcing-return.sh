#!/bin/bash

echo "We now source external-script-return.sh file and ask the customer for a digit between 0 and 9"
echo ". external-script-return.sh"
. external-script-return.sh
return=$?
if [ "$return" -eq 0 ]
	then
	echo "The value returned is a digit between 0 and 9, the exit code was $return"
	else
	echo "The value returned is not a digit between 0 and 9, the exit code was $return"
fi
