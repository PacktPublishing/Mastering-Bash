#!/bin/bash

x=10
y=
unset -v z

echo ${x:?"Should work"}
echo ${y:?"No way"}
echo ${y:?"Well"}
