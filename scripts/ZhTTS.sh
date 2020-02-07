#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.txt"); do
    echo "Creating audio book " $i
    griveAB="/home/rcl/grive/Music/ZhAudioBooks"
    griveAB+=${i:1}
    griveAB=${griveAB/.txt/.ogg}
    espeak -v zh -s 250 --stdout -f $i | oggenc -o $griveAB -
    echo "Removing txt book"
    rm $i
    echo "Audio book created " ${i/.txt/.ogg}
done
cd /home/rcl/grive && grive -V
