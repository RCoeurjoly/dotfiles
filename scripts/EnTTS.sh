#!/bin/bash
IFS=$'\n'
for i in $(find . -name "*.txt"); do
    echo "Creating audio book " $i
    griveAB="/home/rcl/grive/Music/EnAudioBooks"
    griveAB+=${i:1}
    griveAB=${griveAB/.txt/.ogg}
    espeak --stdout -f $i | oggenc -o $griveAB -
    echo "Audio book created " ${i/.txt/.ogg}
done
cd /home/rcl/grive && grive -V
