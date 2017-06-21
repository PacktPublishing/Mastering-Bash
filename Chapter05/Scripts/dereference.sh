#!/bin/bash

a10=20

print_value()
{
	echo -e
	echo -e "The name of the variable passed as \$1 to the function is: $1\n"
	b20=\$"$1"
	echo -e "b20 holds the reference to the content of the variable passed on the command line: $b20\n"
	c30=${b20//[[:punct:]][[:alpha:]]}
	echo -e "But playing with parameter substitution we got an untyped value out of it: $c30\n"
	eval d40=\$$1
	e50=$(($d40+$c30))
	echo "And we used it as in integer to add to the original value we received"
        echo -e "as input so the integer extracted from the name of the variable added to the variable value is: $e50\n" 
	eval $1=$e50
	echo -e "Thanks to eval we assign the new value to the original input\n" 
	echo -e "The value of \$1 now is: $e50\n"
}
echo -e
echo "The value of a10 before triggering the function is: $a10"
print_value a10
echo -e "The value of a10 after triggering the function is: $a10\n"

exit 0
