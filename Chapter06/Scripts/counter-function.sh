#!/bin/bash

counter()
{
	echo {10..0..2}
}
for i in $(counter)
do
	echo "$i"
done
