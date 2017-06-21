#!/bin/bash

while true
do
	clear
	cat <<MENU
	BACKUP UTIL v 1.0
	------------------
	1. Backup a file/directory
	2. Restore a file/directory
	0. Quit
	------------------
MENU
PS3="Which file do you want to backup? "
touch EXIT 
	read -p "Please select an option, 0 or Q to exit: " option
	case $option in
		1 | [Bb])
		  echo "You chose the first option, Backup"
		  clear
		  select file in *
		  do
			case "$file" in 
				EXIT)
				echo "Ok, we exit!"
				rm EXIT
				break
				;;
                                *)
				if [ -z "$file" ]
				then 
					echo "Please, select one of the number displayed"
					sleep 3
					continue
				fi
                  		echo "Compressing file $file"
				tar cvzf "${file}".tgz "$file"  || exit 1
				echo "File $file compressed."
				ls "${file}".tgz
				echo "Press a key to return to main menu..."
				read
				break
				;;
			esac
		  done
		  ;;
		2 | [Rr]) 
		  echo "You chose the second option, Restore"
		  sleep 3
		  ;;
	  	0 | [Qq])
		  echo "You chose the third options, Quit, so we quit!"
		  break
		  ;;
		*)
		  echo "Not a valid choice, please select an option..."
		  sleep 3
		  ;;
	esac
done	
rm EXIT
