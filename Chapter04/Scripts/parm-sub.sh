#!/bin/bash

echo "Hello, can you give me a string of characters?"
read my_string
if [[ "$my_string" =~ ^[[:alpha:]]*$ ]]
	then 
		echo "Printing the variable \$my_string as \${my_string}: ${my_string}" "| No modifications"
		echo "Printing the variable \$my_string as \${my_string^}: ${my_string^}" "| The first char is uppercase"
		echo "Printing the variable \$my_string as \${my_string^^}: ${my_string^^}" "| All chars are uppercase"
		echo "Printing the variable \$my_string as \${my_string,}: ${my_string,}" "| The first char is lowercase"
		echo "Printing the variable \$my_string as \${my_string,,}: ${my_string,,}" "| All chars are lowercase"
	else
		echo "Please, input characters only"
fi
