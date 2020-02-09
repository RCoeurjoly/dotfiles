#!/bin/sh

# Installing Debian packages

sudo apt install \
     abook \
     aptitude \
     arandr \
     build-essential \
     compton \
     curl \
     feh \
     gdb \
     gdbserver \
     git \
     gnome-terminal \
     gnupg2 \
     gnuplot \
     graphviz \
     htop \
     i3 \
     imagemagick \
     isync \
     libnotify-bin \
     msmtp \
     mutt \
     notmuch \
     notmuch-mutt \
     openssl \
     pandoc \
     pass \
     pasystray \
     pcmanfm \
     procmail \
     pwgen \
     redshift \
     rlwrap \
     rofi \
     rxvt-unicode \
     scrot \
     silversearcher-ag \
     stow \
     sudo \
     texlive-base \
     texlive-fonts-recommended \
     texlive-latex-base \
     tree \
     unclutter \
     unifont \
     unar \
     urlscan \
     urlview \
     vim \
     w3m \
     xbindkeys \
     xcape \
     xdotool \
     xsel \
     zathura

# For tlp power management.
sudo apt-get install \
     acpi-call-dkms \
     tlp \
     tp-smapi-dkms

# Installing emacs26

curl https://nixos.org/nix/install | sh
. /home/runner/.nix-profile/etc/profile.d/nix.sh
nix-env --install emacs
source ~/dotfiles/bash/.bashrc.d/utils.bash
createEmacsLink
#sudo mv /usr/bin/emacs /usr/bin/oldemacs

# Installing Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Installing Cask

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

# Install bash it

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
