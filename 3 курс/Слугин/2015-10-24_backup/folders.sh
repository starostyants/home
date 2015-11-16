#!/bin/bash
# создание кучи файлов в куче подкаталогов в куче каталогов

if [[ -z $1 || -z $2 || -z $3 ]]
then
	echo "Неверное количество параметров, запустите скрипт так: $0 количество_каталогов количество_подкаталогов количество_файлов"
	exit 0
fi

directory=$1
subdirectory=$2
file=$3

mkdir temp


while [ $directory -gt 0 ]; do
	mkdir temp/folder-$directory
	dir=$2
	while [ $dir -gt 0 ]; do
		mkdir temp/folder-$directory/subfolder-$dir
		f=$3
		while [ $f -gt 0 ]; do
			touch temp/folder-$directory/subfolder-$dir/file-$f
			let f--
		done
		let dir--
	done
	let directory--
done
