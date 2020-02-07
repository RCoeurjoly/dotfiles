#!/bin/bash
IFS=$'\n'
find . -name '*.epub' -exec sh -c 'a={}; ebook-convert $a ${a%.epub}.mobi' \;

