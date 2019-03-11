#!/bin/bash

echo "+" > 5.txt

./5.1.bash& > 5.txt

while true

do

read line

if [[ $line == "QUIT" ]]

then

exit

fi

echo "$line" >> 5.txt

done
