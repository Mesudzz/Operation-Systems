#!/bin/bash

p="*.bash"

grep -E -o -h -s "^#!\s*/\S+$" $p /bin/ | sed -E "s/^#!\s*(\/\S+)$/\1/" | awk '{scr=tolower($1); a[scr]++} END {for (i in a) {print i, a[i]}}'| sort -nrk 2 | tr -d "[0-9]$" 
