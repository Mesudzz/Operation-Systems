#!/bin/bash
ls /var/log/ > list.txt
tac  list.txt > list2.txt
tac list2.txt | head -1
