#!/bin/sh

# Installing emacs26

curl https://nixos.org/nix/install | sh
. /home/runner/.nix-profile/etc/profile.d/nix.sh
nix-env --install emacs
source bash/.bashrc.d/utils.bash
createEmacsLink

# Installing Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Installing Cask

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

# Install bash it

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
