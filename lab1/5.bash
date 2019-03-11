#!/bin/bash
echo "1 - Start NANO"
echo "2 - Start Vi"
echo "3 - Start Links"
echo "4 - Exit"

read a
case "$a" in
"1")
nano
;;
"2")
vi
;;
"3")
links
;;
"4")
;;
esac
