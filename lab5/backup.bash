#!/bin/bash

backupName="Backup-"$(date +"%Y-%m-%d")
makeNew=1
for ((i = 0; i <= 6; i++))
do
	lastBackup="Backup-"$(date --date="$i days ago" +"%Y-%m-%d")
	if [[ (-d ~/$lastBackup) ]]
	then
		makeNew=0
		break
	fi
done

if [[ $makeNew == 1 ]]
then
	mkdir -p ~/$backupName
	cp ~/source/* ~/$backupName
	if [[ $(ls ~/$backupName) == "" ]]
	then
		echo "В исходной папке отсутвуют файлы."
		rm -rf ~/$backupName
		exit
	fi
	echo "New backup has been created" >> ~/backup-report
	echo "When: $(date)" >> ~/backup-report
	echo "Where: $backupName" >> ~/backup-report
	echo "Files list: " >> ~/backup-report
	ls ~/$backupName >> ~/backup-report
else
	new=""
	updated=""
	echo "Backup has been updated" >> ~/backup-report
	echo "When: $(date)" >> ~/backup-report
	echo "Where: $lastBackup" >> ~/backup-report
	echo "Files list: " >> ~/backup-report
	for file in $(ls ~/source)
	do
		if [[ !(-e ~/$lastBackup/$file) ]]
		then
			cp ~/source/$file ~/$lastBackup/$file
			new=$new"\n"$file
		else
			oldSize=$(ls -o ~/$lastBackup/$file | cut -f4 -d ' ')
			newSize=$(ls -o ~/source/$file | cut -f4 -d ' ')
			if [[ $oldSize -eq $newSize ]]
			then
				continue
			else
				mv ~/$lastBackup/$file ~/$lastBackup/$file.$(date +"%Y-%m-%d")
				cp ~/source/$file ~/$lastBackup/$file
				updated="$updated\n$file $file.$(date +"%Y-%m-%d")"
			fi
		fi
	done
	echo -e $new >> ~/backup-report
	echo -e $updated >> ~/backup-report
fi
echo '------------------------------' >> ~/backup-report
