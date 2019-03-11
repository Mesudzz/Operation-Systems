#!/bin/bash

ps -A -o pid,cmd | tail -n +2 | grep "/sbin/" | awk '{print $1}' > 3.txt
