#!/bin/bash

coproc bc_calc { bc; }
in=${bc_calc[1]}
out=${bc_calc[0]}
echo '10*20' >&$in
read -u $out myvar
echo $myvar
