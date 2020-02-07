while [ 1 ]
do
    find . -mindepth 1 -type f -name "*.epub" -exec printf x \; | wc -c
done
