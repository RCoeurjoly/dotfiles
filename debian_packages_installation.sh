#!/bin/sh

sudo apt-get install stow
# Installing emacs26

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs26

# Installing Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Cloning Exocortex

git clone https://github.com/RCoeurjoly/Exocortex ~/Exocortex

# Installing Debian packages

sudo apt-get install \
abook \
aptitude \
arandr \
build-essential \
compton \
curl \
feh \
git \
gksu \
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
newsboat \
notmuch \
notmuch-mutt \
openssl \
pandoc \
pass \
pasystray \
pcmanfm \
procmail \
pwgen \
python3-proselint \
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
