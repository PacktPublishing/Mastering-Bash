#!/bin/bash

clear
echo -n "May I create an archive out of the current directory files? [yes or no]: "
read input
case $input in

        [yY] | [yY][eE][sS] )
		echo -e
                echo "Yes, of course...I am proceeding"
                echo -e "Archiving the following files...\n"
                now=$(date +%Y.%m.%d.%H.%M.%S)
                filename=${PWD##*/}
                tar cvzf $now.${filename}.tgz * 2>/dev/null
	        if [ $? -ne 0 ]
		then
	    		echo "Sorry there was an issue creating the archive..."
			exit 1
   		else
			echo -e
			echo "Archive ${now}.${filename}.tgz created!"
		exit 0
		fi
                ;;

        [nN] | [nN][oO] )
		echo -e
                echo "No, so have a lovely day.";
		echo -e
                exit 1
                ;;
        *) 
		echo -e
		echo "Please just answer yes or no, y, n, in lower or capital."
		echo -e
            ;;
esac
