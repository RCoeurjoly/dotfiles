#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.mobi"); do
    ebook-convert $i ${i/.mobi/.txt}
done
