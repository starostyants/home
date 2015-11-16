#!/bin/bash
#Скрипт резервного копирования базы 1С

if [ -z $1 ]
then
echo "Попробуйте запустить скрипт так: $0 'каталог для копирования'"
exit 0
fi

postfix='base1c'
input_file=$1
tar -czpf $(date "+%Y-%m-%d_%H%M")-$postfix.tar.gz $input_file
m11_sec=5184000 # период в секундах, старше которого нужно удалить
for i in $(ls *-$postfix.tar.gz) # цикл по всем файлам бэкапов
do
	#time=${i%-$postfix.tar.gz} #o дата из имени файла
	p1=$(echo $i | cut -c-16 | awk -F "_" {'print $1'})
	p2=$(echo $i | cut -c-16 | awk -F "_" {'print $2'})
	utime=$(date --date="$p1 $p2" +%s) # дата в секундах из time
	current_utime=$(date +%s) # дата в секундах из текущего времени
	if [ $(($current_utime-$utime)) -gt $m11_sec ] # если разница в секундах между текущим unixtime и unixtime из файла больше заданного периода
	then
	echo $i
	rm $i # то удаляем файл
	fi
done
