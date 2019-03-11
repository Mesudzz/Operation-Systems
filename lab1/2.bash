#!/bin/bash
a=$1
b=$2
c=$3
max=$c

if [[ "$a" -gt "$max" ]]
then max=$a 
fi
if [[ "$b" -gt "$max" ]]
then max=$b
fi
echo $max 
