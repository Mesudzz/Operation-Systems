#!/bin/bash

ppid=0

sleepavg=0

count=0

res=""

while read str

do

if [[ -n $str ]]

then

newppid=$(echo $str | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")

newsleepavg=$(echo $str | grep -E -h -s -i -o "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+" | awk '{printf("%s",$1)}')

if [[ $ppid == $newppid ]]

then sleepavg=$(echo "$sleepavg+$newsleepavg" | bc -l -q)

count=$(echo "$count+1" | bc -l -q)

else

sleepavg=$(echo "$sleepavg/$count" | bc -l -q)

if [[ -n $res ]]

then

res=$res"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'

fi

sleepavg=$newsleepavg

ppid=$newppid

count=1

fi

res=$res$str$'\n'

fi

done < 5.txt

sleepavg=$(echo "$sleepavg/$count" | bc -l -q)

if [[ -n $res ]]

then

res=$res"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'

fi

echo "$res" > 6.txt
