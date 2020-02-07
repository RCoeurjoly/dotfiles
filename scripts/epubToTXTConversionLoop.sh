#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.epub"); do
    if [ -f "${i/.epub/.txt}" ]
    then
	echo "It has already been converted" $i
    else
	ebook-convert $i ${i/.epub/.txt}
    fi
done
