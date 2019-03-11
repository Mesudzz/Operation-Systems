#!/bin/bash

./6.1.bash&

while true

do

read line

case $line in

"term")

echo "SEND TERM"

kill -SIGTERM $(cat mypid)

exit

;;

esac

done


