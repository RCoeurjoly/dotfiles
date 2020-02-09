#!/bin/sh

# Installing Debian packages

DEBIAN_PACKAGES="abook \
     aptitude \
     arandr \
     build-essential \
     compton \
     curl \
     dirmngr \
     docker \
     docker-compose \
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
"

for package in ${DEBIAN_PACKAGES}; do
    yes | sudo apt install $package
    echo !!
done

# For tlp power management.
sudo apt-get -y install \
     acpi-call-dkms \
     tlp \
     tp-smapi-dkms

sudo apt autoremove
sudo apt autoclean
