#!/bin/bash
for i in $(find . -name "*.html"); do
    lynx --dump $i > ${i/.html/.txt}
    echo "Converting " $i
done
