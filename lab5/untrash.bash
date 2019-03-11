#!/bin/bash

if [[ (! -d ~/.trash) ]]
then
	echo "Корзина пуста"
	exit
fi
if [[ (! -e ~/.trash/.trash.log) ]]
then
	echo "Файл логов корзины отсутвует. Возможно кто-то удалил его???"
	exit 1
fi

cd ~/.trash
existing=0

for searchResult in $(grep -i $1 .trash.log)
do
	fullpath=$(echo "$searchResult" | cut -f1 -d ';')
	trashname=$(echo "$searchResult" | cut -f2 -d ';')
	if [[ ! -e ./$trashname ]]
	then
		continue
	fi
	echo "Восстановить этот файл: $fullpath ?(y/n)(д/н)"
	read answer
	case $answer in
		[YyДд])
			existing=1
			break
			;;
		[NnНн])
			;;
	esac
done

if [[ $existing == "0" ]]
then
	echo "Этого файла нет в корзине или ни один файл не выбран"
	exit 2
fi

if [[ ( -e ~/lab5/$1) ]]
then
	echo "Файл с таким именем уже существует"
	exit
fi
if [[ ( -d ~/lab5/$1) ]]
then
	echo "Директория с таким именем уже существует"
	exit
fi
ln $trashname $fullpath
rm $trashname
