#!/bin/bash

echo "This is the main subshell"
(echo "And this is the second" ; for i in {1..10} ; do echo $i ; done)
