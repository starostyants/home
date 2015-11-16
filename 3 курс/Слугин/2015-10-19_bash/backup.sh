#!/bin/bash
#Скрипт резервного копирования базы 1С

if [ -z $1 ]
then
echo "Попробуйте запустить скрипт так: $0 'каталог для копирования'"
exit 0
fi

input_file=$1
tar -czpf $(date +%Y-%m-%d)-base1c.tar.gz $input_file
