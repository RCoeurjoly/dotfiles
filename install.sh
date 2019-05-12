#!/bin/sh

# Install all the necessary Debian packages, especially `stow`.
yes | ./debian_packages_installation.sh

stow ~/dotfiles/bash
stow ~/dotfiles/spacemacs
stow ~/dotfiles/email
stow ~/dotfiles/firefox
stow ~/dotfiles/git
stow ~/dotfiles/lisp
stow ~/dotfiles/rss
stow ~/dotfiles/ruby
stow ~/dotfiles/x-windows

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
