#!/bin/bash

date=$(date '+%d.%m.%y_%H:%M:%S')

mkdir ~/test && echo "catalog test was created successfully" >> ~/lab4/report && touch ~/test/$date

ping -c 1 www.net_nikogo.ru || echo "ERROR" >> ~/lab4/report
