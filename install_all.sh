#!/bin/sh

# Install all the necessary Debian packages, especially `stow`.

bash install_debian_packages.sh

bash install_emacs.sh

# # Link .bash_profile -> .bashrc
rm -f ~/.bashrc
rm -rf ~/.emacs.d/

stow bash
stow spacemacs
stow x-windows
stow git
stow gdb
stow lisp
stow rss
stow ruby