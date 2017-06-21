#!/bin/bash

fred=$(tput setaf 1)
fgreen=$(tput setaf 2)
fwhite=$(tput setaf 7)
bblue=$(tput setab 4)
esmso=$(tput smso)
xsmso=$(tput rmso)
dim=$(tput dim)
reset=$(tput sgr0)
hide=$(tput civis)

box() {
    printf ${hide} 
    printf ${bblue} 
    width=$(tput cols)
    height=$(tput lines)
    message="Width is: ${esmso}${fgreen}$width${fwhite} Height is: ${dim}${fred}$height${reset}"
    #message="Width is: $width Height is: $height"
    length=${#message}
    clear
    tput cup $((height / 2)) $(((width / 2) - ((length - 29) / 2)))
    printf "$message"
}

trap box WINCH

box

while true
do
	:
done

