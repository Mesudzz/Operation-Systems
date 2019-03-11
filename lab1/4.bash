#!/bin/bash
i=0
read b
let c=b%2
while [ $c -ne 0 ]
do
read b
let c=b%2
let i=$i+1
done

echo $i
