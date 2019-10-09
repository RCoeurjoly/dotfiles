#!/bin/sh

# Install all the necessary Debian packages, especially `stow`.
bash debian_packages_installation.sh

# Link .bash_profile -> .bashrc
rm -f ~/.bashrc

stow bash
stow spacemacs
stow email
stow firefox
stow git
stow lisp
stow rss
stow ruby
stow x-windows
