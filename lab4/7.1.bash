#!/bin/bash

echo $$ > mypid

i=1

mode="+"

sigterm()

{

echo "STOP"

exit

}

addition()

{

mode="+"

}

multiplication()

{

mode="*"

}

trap 'sigterm' SIGTERM

trap 'addition' USR1

trap 'multiplication' USR2

while true

do

case $mode in

"+")

let i=$i+2

;;

"*")

let i=$i*2

;;

esac

echo $i

sleep 1

done
