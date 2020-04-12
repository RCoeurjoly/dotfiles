#!/bin/bash
if [ -e $HOME/.bashrc.d/config.bash ]; then
    source $HOME/.bashrc.d/config.bash
else
    source bash/.bashrc.d/config.bash
fi
install_all
