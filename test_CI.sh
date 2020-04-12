cd spacemacs/.spacemacs.d; cask install; cask exec ecukes --reporter spec
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
    if ! dpkg -l $package; then
        echo "Package" $package "is not installed"
        exit 1
    fi
done

NON_DEBIAN_PACKAGES="simple-mtpfs \
                            emacs \
                           "

for package in ${NON_DEBIAN_PACKAGES};
do
    if ! $package --version; then
        echo "Package" $package "is not installed"
        exit 1
    fi
done
