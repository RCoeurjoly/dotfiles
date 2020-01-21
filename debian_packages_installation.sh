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
sudo mv /usr/bin/emacs /usr/bin/oldemacs
sudo ln -s /nix/store/acc8bl45j58b8yxj8wadr0ji5kh1sqry-user-environment/bin/emacs-26.3 /usr/bin/emacs

# Installing Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Installing Cask

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
