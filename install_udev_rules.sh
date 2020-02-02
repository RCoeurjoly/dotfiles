# -*- mode: sh -*-
for file in ~/dotfiles/udev_rules/*
do
    ln -s ${file} /etc/udev/rules.d/$(basename $file)
done
