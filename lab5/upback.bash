#!/bin/bash

backupName=$(ls ~ | grep "^Backup-" | tail -n1)
mkdir ~/restore

for file in $(ls ~/$backupName | grep -isPvh ".[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
	cp ~/$backupName/$file ~/restore/$file
done
