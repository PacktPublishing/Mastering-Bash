#!/bin/bash

pipefile="mypipefile"

if [[ ! -p $pipefile ]] 
then
	mknod $pipefile p
fi

while true
do
read row <$pipefile
if [[ "$row" == 'exit' ]]
then
	   echo "I read $row so exiting"
           break
fi
echo $row
done
