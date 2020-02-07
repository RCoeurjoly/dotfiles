find . -mindepth 1 -type f -name "*.pdf" -exec printf x \; | wc -c
