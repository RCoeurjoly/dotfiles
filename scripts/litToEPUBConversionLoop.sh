#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.lit"); do
    ebook-convert $i ${i/.lit/.epub}
done
