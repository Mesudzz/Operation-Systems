#!/bin/bash

if [[ "$1" = "" ]]
then
	echo "Возможно вы забыли указать файл"
	exit
fi

fullpath=$(readlink -s -m -- $1)
if [[ ! -d ~/.trash ]]
then
	mkdir ~/.trash
fi

if [[ ! -e "$fullpath" ]]
then
	echo "Файл не существует. Попробуйте еще раз"
	exit 1
fi

if [[ -d "$fullpath" ]]
then
	echo $fullpath "Это директория"
	exit 2
fi

cd ~/.trash
touch .trash.log
trashname=$(date +"%r")
ln $fullpath $trashname
rm $fullpath
echo $fullpath';'$trashname >> .trash.log
