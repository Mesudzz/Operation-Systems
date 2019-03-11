#!/bin/bash
while [ "$b" != "q" ]
do
read b
str=$str$b
done

echo $str 
