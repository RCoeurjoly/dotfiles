#!/bin/bash
if [ -e $HOME/.bashrc.d/config.bash ]; then
    source $HOME/.bashrc.d/config.bash
else
    source .bashrc.d/config.bash
fi
install_all
