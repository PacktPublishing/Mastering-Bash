#!/bin/bash

#!/bin/bash
echo "Setting the variable x"
x=10
echo "Printing the value of x"
echo ${x}
echo "Printing the value of x with a default value on assigned value"
echo "${x:+100}"
echo "Printing the value of x after default"
echo ${x}
echo "Unsetting x"
unset -v x
echo "Printing the value of x using a default fallback value"
echo "${x:+20}"
echo "Printing the value of x"
echo ${x}
echo "Setting the variable x with assignement"
echo "${x:+30}"
echo "Printing the value of x again"
echo ${x}
