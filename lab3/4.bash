#!/bin/bash

grep -E ' ' /proc/*/statm | tr '/' ' ' | awk '{print $2, ":", $4-$5}' | sort -n -k 3 > 4.txt
