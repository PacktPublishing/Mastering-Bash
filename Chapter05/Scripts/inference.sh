#!/bin/bash

FIRST_VALUE=SECOND_VALUE
SECOND_VALUE=20

print_value()
{
	echo "The value of \$1 is: $1"
}
print_value "${FIRST_VALUE}"
print_value "${!FIRST_VALUE}"

exit 0
