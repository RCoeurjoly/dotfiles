#!/bin/sh

sudo apt install stow
# Installing emacs26

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt remove emacs*
sudo apt install emacs26

# Installing Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

sudo apt install \
     abook \
     aptitude \
     arandr \
     build-essential \
     compton \
     curl \
     feh \
     git \
     gksu \
     gnupg2 \
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
     # python3-proselint \
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


#Follow the instructions below to install SymbiYosys and its dependencies. Yosys, SymbiYosys, and Z3 are non-optional. The other packages are only required for some engine configurations.
#Prerequisites

# Installing prerequisites (this command is for Ubuntu 16.04):

sudo apt-get install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev git mercurial graphviz   \
                     xdot pkg-config python python3 libftdi-dev gperf \
                     libboost-program-options-dev autoconf libgmp-dev \
                     cmake

##Yosys, Yosys-SMTBMC and ABC

#http://www.clifford.at/yosys/

#https://people.eecs.berkeley.edu/~alanmi/abc/

#Next install Yosys, Yosys-SMTBMC and ABC (yosys-abc):
cd
git clone https://github.com/cliffordwolf/yosys.git yosys
cd yosys
make -j$(nproc)
sudo make install
cd

#SymbiYosys

#https://github.com/cliffordwolf/SymbiYosys
cd
git clone https://github.com/cliffordwolf/SymbiYosys.git SymbiYosys
cd SymbiYosys
sudo make install
cd

#Yices 2

#http://yices.csl.sri.com/
cd
git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
sudo make install
cd

#Z3

#https://github.com/Z3Prover/z3/wiki
cd
git clone https://github.com/Z3Prover/z3.git z3
cd z3
python scripts/mk_make.py
cd build
make -j$(nproc)
sudo make install
cd

#super_prove (Pending)

#https://bitbucket.org/sterin/super_prove_build

#Download the right binary .tar.gz for your system from http://downloads.bvsrc.org/super_prove/ and extract it to /usr/local/super_prove.

#Then create a wrapper script /usr/local/bin/suprove with the following contents:

#!/bin/bash
#tool=super_prove; if [ "$1" != "${1#+}" ]; then tool="${1#+}"; shift; fi
#exec /usr/local/super_prove/bin/${tool}.sh "$@"

#Avy

#https://arieg.bitbucket.io/avy/
cd
git clone https://bitbucket.org/arieg/extavy.git
cd extavy
git submodule update --init
mkdir build; cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
sudo cp avy/src/{avy,avybmc} /usr/local/bin/
cd

#Boolector

#http://fmv.jku.at/boolector/
cd
git clone https://github.com/Boolector/boolector
git clone https://github.com/arminbiere/lingeling boolector/deps/lingeling
git clone https://github.com/boolector/btor2tools boolector/deps/btor2tools
( cd boolector/deps/lingeling  && ./configure.sh -fPIC && make -j$(nproc); )
( cd boolector/deps/btor2tools && ./configure.sh -fPIC && make -j$(nproc); )
( cd boolector && ./configure.sh && cd build && make -j$(nproc); )
sudo cp boolector/build/bin/{boolector,btor*} /usr/local/bin/
sudo cp boolector/deps/btor2tools/bin/btorsim /usr/local/bin/
cd

## End of installing instructions for formal verification with Yosys

# For tlp power management.
sudo apt install \
     acpi-call-dkms \
     tlp \
     tp-smapi-dkms
