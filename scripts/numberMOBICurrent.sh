while [ 1 ]
do
    find . -mindepth 1 -type f -name "*.mobi" -exec printf x \; | wc -c
done
