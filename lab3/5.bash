#!/bin/bash

status=""

for pid in $(ps -A -o pid | tail -n +2)

do

file="/proc/"$pid"/status"

file1="/proc/"$pid"/sched"

ppid=$(grep -E -h -s -i "ppid:\s(.+)" $file | grep -o "[0-9]\+")

nrswitches=$(grep -E -h -s -i "nr_switches(.+)" $file1 | grep -o "[0-9]\+")

execruntime=$(grep -E -h -s -i "se.sum_exec_runtime(.+)" $file1 | grep -o "[0-9]\+\.[0-9]\+")

sleepavg=($execruntime $nrswitches awk '{$1/$2}')

if [[ -z $sleepavg ]]

then sleepavg=0

fi

if [[ $ppid != "" ]]

then status=$status"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$sleepavg$'\n'

fi

done

echo "$status" | sort -t " " -k2 > 5.txt
