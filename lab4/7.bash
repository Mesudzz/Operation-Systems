#!/bin/bash

./7.1.bash&

while true

do

read line

case $line in

"term")

kill -SIGTERM $(cat mypid)

exit

;;

"+")

kill -USR1 $(cat mypid)

;;

"*")

kill -USR2 $(cat mypid)

;;

esac

done
