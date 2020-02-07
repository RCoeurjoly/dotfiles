txt='find . -mindepth 1 -type f -name "*.txt"'
epub='find . -mindepth 1 -type f -name "*.epub"'
txt100='expr $txt * 100'
percentage='expr $txt / 100'
echo $percentage
