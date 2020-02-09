#!/bin/sh

# Installing Debian packages

DEBIAN_PACKAGES="aptitude \
     arandr \
     build-essential \
     curl \
     docker \
     docker-compose \
     gdb \
     gdbserver \
     git \
     gnome-terminal \
     gnupg2 \
     gnuplot \
     graphviz \
     i3 \
     imagemagick \
     openssl \
     pandoc \
     stow \
     sudo \
     texlive-base \
     texlive-fonts-recommended \
     texlive-latex-base \
     unar \
"

for package in ${DEBIAN_PACKAGES};
do
    echo
    echo "Installing" $package
    echo
    yes | sudo apt install $package
done

# For tlp power management.
sudo apt-get -y install \
     acpi-call-dkms \
     tlp \
     tp-smapi-dkms
