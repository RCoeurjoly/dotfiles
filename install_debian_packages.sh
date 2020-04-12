#!/bin/bash

# Installing Debian packages

DEBIAN_PACKAGES="aptitude \
     arandr \
     build-essential \
     clang \
     cmake \
     curl \
     docker \
     docker-compose \
     gdb \
     gdbserver \
     git \
     global \
     gnome-terminal \
     gnupg2 \
     gnuplot \
     graphviz \
     i3 \
     ibus \
     ibus-pinyin \
     imagemagick \
     openssl \
     pandoc \
     stow \
     sudo \
     texlive-base \
     texlive-fonts-recommended \
     texlive-latex-base \
     unar \
     sqlite3 \
     mongod \
"

for package in ${DEBIAN_PACKAGES};
do
    echo
    echo "Installing" $package
    echo
    sudo apt -y install $package >&/dev/null
done

# For tlp power management.
sudo apt-get -y install \
     acpi-call-dkms \
     tlp \
     tp-smapi-dkms

test_debian_packages() {
    for package in ${DEBIAN_PACKAGES};
    do
        $package --version
    done
}
