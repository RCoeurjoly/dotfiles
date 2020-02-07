#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.djvu"); do
    ebook-convert $i ${i/.djvu/.pdf}
done
