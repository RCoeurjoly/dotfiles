#!/bin/bash
for i in $(ls /home/rcl/Downloads/tor-browser_en-US/Browser/Downloads/); do
    ebook-convert $i ${i/.epub/.mobi}
done
