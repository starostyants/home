#!/bin/bash
for i in $(seq 1 9)
do
	for j in $(seq 1 9)
	do
		cp 2015-10-19-base1c.tar.gz 2015-0"$i"-0"$j"-base1c.tar.gz
	done
        for j in $(seq 10 31)
        do
                cp 2015-10-19-base1c.tar.gz 2015-"$i"-"$j"-base1c.tar.gz
        done
done

for i in $(seq 10 12)
do
        for j in $(seq 1 9)
        do
                cp 2015-10-19-base1c.tar.gz 2015-"$i"-0"$j"-base1c.tar.gz
        done
        for j in $(seq 10 31)
        do
                cp 2015-10-19-base1c.tar.gz 2015-"$i"-"$j"-base1c.tar.gz
        done
done


