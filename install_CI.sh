INITIALDIR=$( pwd )
git clone https://github.com/phatina/simple-mtpfs ~/simple-mtpfs
cd ~/simple-mtpfs
./autogen.sh
mkdir build && cd build
../configure
make
sudo make install
rm -rf ~/simple-mtpfs
cd $INITIALDIR

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it



git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

curl https://nixos.org/nix/install | sh
. /home/runner/.nix-profile/etc/profile.d/nix.sh

nix-env --install emacs
for location in $(whereis emacs);
do
    SEARCH_RESULT="$(echo $location | grep "\/nix.*user-environment\/bin\/emacs")"
    if [ "${SEARCH_RESULT}" ]; then
        NIX_EMACS=${SEARCH_RESULT}
        sudo rm /usr/bin/emacs
        sudo ln -s ${NIX_EMACS} /usr/bin/emacs;
    fi
done

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
DEBIAN_PACKAGES="aptitude \
                        arandr \
                        build-essential \
                        clang \
                        cmake \
                        acpi-call-dkms \
                        tlp \
                        tp-smapi-dkms \
                        curl \
                        docker \
                        docker-compose \
                        gdb \
                        libfuse-dev \
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
                        mongodb-org \
                        openssl \
                        pandoc \
                        sqlite3 \
                        stow \
                        sudo \
                        texlive-base \
                        texlive-fonts-recommended \
                        texlive-latex-base \
                        unar \
                        auto-complete-el \
"
for package in ${DEBIAN_PACKAGES};
do
    echo
    echo "Installing" $package
    echo
    sudo apt -y install $package >&/dev/null
done
stow bash
stow spacemacs
stow x-windows
stow git
stow gdb
stow lisp
stow rss
