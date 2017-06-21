#!/bin/bash

echo "We now source external-script-return-whatever.sh file and ask the customer for a digit between 0 and 9"
echo ". external-script-return-whatever.sh"
returning=$(. external-script-return-whatever.sh)
echo "$returning"
