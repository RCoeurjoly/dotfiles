#!/bin/bash
source $HOME/.bin/git-completion.sh
ulimit -c unlimited

export ALTERNATE_EDITOR=""
export BROWSER="firefox"
export CC="gcc"
export CXX="g++"
export CMAKE_C_COMPILER="gcc"
export CMAKE_CXX_COMPILER="g++"
export EDITOR="$HOME/.bin/em"
export EMAIL="rolandcoeurjoly@gmail.com"
export GOPATH="$HOME/code/go"
export GPG_TTY=$(tty)export HOMEBREW_NO_ANALYTICS=1
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export NAME="Roland Coeurjoly"
export PROMPT_DIRTRIM=3
export KICAD_SYMBOL_DIR="/usr/share/kicad/library/"
export SOCKS5_PASSWORD=''
export GDBHISTSIZE=
export HISTFILESIZE=
export HISTSIZE=
export PS1=" \[\033[34m\]\u@\h \[\033[33m\]\w\[\033[31m\]\[\033[00m\] $ "
export HISTCONTROL=ignoredups:erasedups
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTTIMEFORMAT="%d/%m/%y %T "
export GEM_HOME="$HOME/.gem"
export GTI_SPEED=4000

### local config settings, if any

if [ -e $HOME/.bashrc.local ]; then
  source $HOME/.bashrc.local
fi

export DEBIAN_PACKAGES="aptitude \
                        arandr \
                        build-essential \
                        clang \
                        cmake \
                        libmtp-dev \
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
pathmunge () {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

pathmunge /usr/lib64/ccache
pathmunge /usr/local/sbin
pathmunge $HOME/.cask/bin
pathmunge $HOME/dotfiles/scripts
pathmunge /usr/bin
pathmunge /usr/share
pathmunge /usr/local/bin
pathmunge /usr/local/heroku/bin
pathmunge /usr/lib/mutt
pathmunge /sbin after
pathmunge $HOME/bin after
pathmunge $HOME/.bin after
pathmunge $HOME/.cabal/bin after
pathmunge $HOME/.local/bin after
pathmunge $GOPATH/bin after
pathmunge $HOME/go/bin
pathmunge $HOME/.gem/bin
pathmunge /usr/lib64/ccache

export PATH

# -*- mode: sh -*-

alias dc="docker-compose"
alias clangcmakepp="CXX='clang_complete_args.py g++' cmake .."
alias gatherclangcomplete="find .. | ag clang_complete | xargs cat | sort | uniq > ../.clang_complete"
alias clangcompletepp="clangcmakepp && make && gatherclangcomplete"
alias gg="git grep -n"
#alias git="hub"
alias gpg="gpg2"
alias less="less -R" # display colors correctly
alias sbcl="rlwrap sbcl"
alias lisp="sbcl --noinform"
alias lispi="sbcl -noinform --load"
alias la="ls -la"
alias ll="ls -l -a"
alias ln="ln -v"
alias ls="ls --color -h"
alias lh='ls -lahS'

alias mkdir="mkdir -p"
alias mutt="cd $HOME/downloads; /usr/bin/mutt; cd - > /dev/null"
alias myip="ip address | grep inet.*wlan0 | cut -d' ' -f6 | sed \"s/\/24//g\""
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
alias speedtest='echo "scale=2; `curl  --progress-bar -w "%{speed_download}" http://10.0.4.247/repo/inntech/el7/boost_1.70.0-1.el7-1.x86_64.rpm -o /dev/null` / 104000000" | bc | xargs -I {} echo {} mbps'
alias tree="tree -C" # add colors
alias ut="tar xavf"
alias pcsu='sudo pcs resource unmanage '
alias pcsm='sudo pcs resource manage '
alias pcsd='sudo pcs resource disable '
alias pcse='sudo pcs resource enable '
alias pcsc='sudo pcs resource cleanup '
alias pcsw='sudo pcs resource show '
alias pcsx='sudo pcs resource delete '
alias pcsr='sudo pcs resource restart '
alias pcss='sudo pcs status | grep '


# Make using all available cores
alias make="make -j$( nproc --all )"

usage() {
  du -sch "$@" | sort -h
}

### Ruby/Rails-specific
alias be="bundle exec"
alias migrate="be rake db:migrate db:test:prepare"

### Package management
alias agi="sudo apt install"
alias agr="sudo apt remove"
alias acs="apt search"
alias agu="sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo aptitude clean"
alias ali="apt-mark showmanual"

alias oports="echo 'User:      Command:   Port:'; echo '----------------------------' ; lsof -i 4 -P -n | grep -i 'listen' | awk '{print \$3, \$1, \$9}' | sed 's/ [a-z0-9\.\*]*:/ /' | sort -k 3 -n |xargs printf '%-10s %-10s %-10s\n' | uniq"
alias serve="python -m SimpleHTTPServer"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# find big files and directories
alias duh='du -h | sort -rh | head -20'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# -*- mode: sh -*-

GIT_PS1_SHOWDIRTYSTATE=true

# __git_ps1 reports "((unknown))" in directories with broken git
# repositories; unfortunately, pre-commit hooks are generally kept in
# an empty git repo in $HOME, resulting in unneeded grossness.
__quiet_git_ps1() {
  local b="$(__git_ps1)"
  if [ "$b" != " ((unknown))" ]; then
    echo -n "$b"
  fi
}

PS1='\[\033[36m\][\w$(__quiet_git_ps1)] \$ \[\033[00m\]'

amIinDocker(){
    if isGCCgood && isOSgood; then
        echo "You are in Docker"
        return 0
    else
        echo "You are not in Docker"
        return 1
    fi
}
isOSgood(){
    REDHAT_RELEASE_IN_DOCKER='CentOS Linux release 7.7.1908 (Core)'

    if [ "$(cat /etc/redhat-release)" == "${REDHAT_RELEASE_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
isGCCgood(){
    GCC_IN_DOCKER='gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.'

    if [ "$(gcc --version)" == "${GCC_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
switch_to_docker () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        CURRENTDIR=$( pwd )
        build_dockerimage
        MY_UID=$UID docker-compose -f ~/docker-services/dev/docker-compose.yml up -d
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "cd ${CURRENTDIR} && bash"
    else
        echo "You are already in Docker, genius"
        return 0
    fi
}

build_dockerimage () {
    docker image build ~/docker-services/base_dev/ -t service:base_dev --build-arg "USER=$USER" --build-arg "UID=$UID"
}
executeInDocker () {
    CURRENTDIR=$( pwd )
    docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "cd ${CURRENTDIR} && $1"
}
switch_to_traditional () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese false; ibus restart
}
switch_to_simplified () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese true; ibus restart
}
grepcpp () {
    grep -IRsnEi --exclude-dir=build --include="*.h" --include="*.cpp" --include="*.hpp" "${@}"
}
greper () {
    grep -IRsnEi --exclude-dir=env --exclude-dir=build --exclude="*.bash_history" "${@}"
}
generateclangcomplete () {
    GIT_ROOT=$(git rev-parse --show-toplevel)
    echo "Removing"${GIT_ROOT}/build/
    rm -rf ${GIT_ROOT}/build/
    mkdir ${GIT_ROOT}/build/
    cd ${GIT_ROOT}/build
    clangcompletepp
    cd -
}
timestamp () {
    date +"%Y-%m-%d_%H:%M:%S.%N"
}
lazygit() {
    cd ~/Exocortex
    git add .
    git commit -m "`date`"
    git push
    cd -
}
areTherePirateVersions() {
    if [ "$(git tag | grep pirate | wc -l)" == 0 ]; then
        return 0
    else
        return 1
    fi
}
hitchhikersGuideToTheGalaxy() {
    return 42
}
findFIXfield_in_Docker () {
    VTFIXDataDictionary=/data/programs/vtcommon-files/dictionary/VTFIXDataDictionary.xml
    FixValues=/usr/local/quickfix-1.13.3.VT13/include/quickfix/FixValues.h
    VTFixFieldNumbers=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFieldNumbers.h
    VTFixFields=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFields.h
    query_input=$1

    grep -vh required $VTFIXDataDictionary $FixValues $VTFixFieldNumbers $VTFixFields | grep -Phi "field\s(number|name)=\".*?${query_input}.*?\""
}

findFIXfield () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "source ~/.bashrc.d/scripts.bash >/dev/null && findFIXfield_in_Docker $1" 2>/dev/null | grep -Pi "field.*$1.*?\""
    else
        findFIXfield_in_Docker "$1"
    fi
}
findMeaningOfValueOfFIXfield_in_Docker () {
    VTFIXDataDictionary=/data/programs/vtcommon-files/dictionary/VTFIXDataDictionary.xml
    FixValues=/usr/local/quickfix-1.13.3.VT13/include/quickfix/FixValues.h
    VTFixFieldNumbers=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFieldNumbers.h
    VTFixFields=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFields.h

    if [ "$#" == 2 ]; then
        VALUE="$2"
    else
        VALUE=
    fi
    FIELD_NAME=$1
    grep -Phi  "const.*${FIELD_NAME}.*${VALUE}.*;" $VTFIXDataDictionary $FixValues $VTFixFieldNumbers $VTFixFields
}

findMeaningOfValueOfFIXfield () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "source ~/.bashrc.d/scripts.bash >/dev/null && findMeaningOfValueOfFIXfield_in_Docker $1 $2" 2>/dev/null | grep "const.*;"
    else
        findMeaningOfValueOfFIXfield_in_Docker "$1" "$2"
    fi
}
tcr_loop() {
    test_command="$@"

    if ! git isworkdirclean; then
        echo "Please make sure you have a clean working directory before starting the TCR loop"
        echo "Commit changes and come back for some fun!"
        return 1
    fi

    if ! ${test_command}; then
        echo
        echo "Please make sure the test command passes before starting the TCR loop"
        echo "Maybe test a smaller subcase more relevant to the files you are going to work on?"
        return 1
    fi

    inotify-hookable \
        --watch-directories $(pwd) --quiet \
        --ignore-paths $(pwd)/.git/ $(pwd)/build/ \
        -c "if ! git isworkdirclean && ! git isrebaseinprocess; then \
               ${test_command} && git wip || git reset --hard; \
            fi"
}
install_debian_packages() {
    for package in ${DEBIAN_PACKAGES};
    do
        echo
        echo "Installing" $package
        echo
        sudo apt -y install $package >&/dev/null
    done
}
install_simple-mtpfs() {
    PACKAGE=simple-mtpfs

    if $PACKAGE --version; then
        echo $PACKAGE " already installed"
        return 0
    fi

    if [ -d ~/$PACKAGE ]; then
        rm -rf ~/$PACKAGE
    fi

    INITIALDIR=$( pwd )
    git clone https://github.com/phatina/simple-mtpfs ~/$PACKAGE
    cd ~/$PACKAGE
    ./autogen.sh
    mkdir build && cd build
    ../configure
    make
    sudo make install
    rm -rf ~/$PACKAGE
    cd $INITIALDIR
}
install_emacs() {
    nix-env --install emacs
    create_emacs_link
}
install_spacemacs() {
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
}
install_nix(){
    curl https://nixos.org/nix/install | sh
    . /home/runner/.nix-profile/etc/profile.d/nix.sh
}
install_cask() {
    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
}
install_all() {
   install_debian_packages
   install_bash_it
   install_cask
   install_nix
   install_spacemacs
   install_emacs
   install_simple-mtpfs
   rm -f ~/.bashrc
   stow_dirs
}

install_bash_it() {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
}
stow_dirs() {
    stow bash
    stow spacemacs
    stow x-windows
    stow git
    stow gdb
    stow lisp
    stow rss
}
# -*- mode: sh -*-
is_user_root () { [ ${EUID:-$(id -u)} -eq 0 ]; }

ssh5 () { ssh drcoeurjoly@10.0.9.240; }

gdbmi () { gdb -i=mi; }

ssh6 () { ssh drcoeurjoly@10.0.9.241; }

findKindle() {
    #        NAME           FSTYPE LABEL
    regex="([A-Za-z0-9]*)\s*vfat\s*Kindle"
    if [[ $(lsblk -f) =~ $regex ]]
    then
        echo "/dev/${BASH_REMATCH[1]}"
        return 0
    else
        echo "No Kindle is connected"
        return 1
    fi
}

isKindleMounted() {
    #        NAME           FSTYPE LABEL    UUID        MOUNTPOINT
    regex="([A-Za-z0-9]*)\s*vfat\s*Kindle\s*5854-3617\s*(/media/kindle)"
    if [[ $(lsblk -f) =~ $regex ]]
    then
        echo "Kindle (/dev/${BASH_REMATCH[1]}) already mounted in ${BASH_REMATCH[2]}"
        return 0
    elif findKindle >&/dev/null
    then
        echo "Kindle not mounted, available at $(findKindle)"
    else
        findKindle
    fi
    return 1
}

getMTPpoint() {
    number="([0-9]*):\s"
    pocketComputerRegex="AsusZenFone\s5\sA500KL\s\(MTP\)"
    bigReaderRegex="VariousViewpia\sDR/bq\sKepler\sDebugging"

    # if no command line arg given exit
    if [ -z $1 ]
    then
        exit 1
    elif [ -n $1 ]
    then
        # otherwise make first arg as device
        device=$1
    fi

    # use case statement to make decision for rental
    case $device in
        "pocket_computer")
            deviceRegex=${pocketComputerRegex};;
        "big_reader")
            deviceRegex=${bigReaderRegex};;
        *)
            echo "Sorry, $device is not a known device!";
            return 1;;
    esac

    if [[ $(simple-mtpfs -l)  =~ ${number}${deviceRegex} ]]
    then
        echo "${BASH_REMATCH[1]}"
        return 0
    else
        echo "$device is not connected"
        return 1
    fi
}

isPocketComputerMounted() {
    return 1
}


mountMTPdevice() {
    # if no command line arg given exit
    if [ -z $1 ]
    then
        exit 1
    elif [ -n $1 ]
    then
        # otherwise make first arg as device
        device=$1
    fi

    # use case statement to make decision for rental
    case $device in
        "pocket_computer");;
        "big_reader");;
        *)
            echo "Sorry, $device is not a known device!";
            return 1;;
    esac

    mkdir ~/${device}
    if getMTPpoint ${device} >&/dev/null
    then
        simple-mtpfs --device $(getMTPpoint ${device}) ~/${device}
        return 0
    else
        return 1
    fi
}

unmountMTPdevice() {
    # if no command line arg given exit
    if [ -z $1 ]
    then
        exit 1
    elif [ -n $1 ]
    then
        # otherwise make first arg as device
        device=$1
    fi

    # use case statement to make decision for rental
    case $device in
        "pocket_computer");;
        "big_reader");;
        *)
            echo "Sorry, $device is not a known device!";
            return 1;;
    esac

    fusemount -u ~/${device}
    rmdir ~/${device}
}


mountPocketComputer() {
    mountMTPdevice pocket_computer
}

unmountPocketComputer() {
    unmountMTPdevice pocket_computer
}

isBigReaderMounted() {
    return 1
}

mountBigReader() {
    mountMTPdevice big_reader
}

unmountBigReader() {
    unmountMTPdevice big_reader
}

setkeyboard() {
    setxkbmap -layout us,es
    setxkbmap -option 'grp:rctrl_toggle'
}

findprocess(){
    if [ "$(ps -aux | grep -v grep | grep "${1}\|PID" | wc -l)" -ne 1 ]; then
        ps -aux | grep -v grep | grep "${1}\|PID"
        return 0
    else
        echo "Process" ${1} "not found"
        return 1
    fi
}

ishistoryuniq(){
    if [ "$(grep -v ^# ~/.bash_history | wc -l)" -eq "$(grep -v ^# ~/.bash_history | uniq | wc -l)" ]; then
        #echo "$(grep -v ^# ~/.bash_history | wc -l)"
        #echo "$(grep -v ^# ~/.bash_history | uniq | wc -l)"
        #echo "$(${COMMAND_SEARCH} | wc -l)"
        #echo "$(${COMMAND_SEARCH} | uniq | wc -l)"
        echo "All unique commands in history"
        return 0
    else
        # echo "$(grep -v ^# ~/.bash_history | wc -l)"
        # echo "$(grep -v ^# ~/.bash_history | uniq | wc -l)"
        # echo "$(${COMMAND_SEARCH} | wc -l)"
        # echo "$(${COMMAND_SEARCH} | uniq | wc -l)"
        echo "History not uniq"
        return 1
    fi
}




create_emacs_link() {
    for location in $(whereis emacs);
    do
        SEARCH_RESULT="$(echo $location | grep "\/nix.*user-environment\/bin\/emacs")"
        if [ "${SEARCH_RESULT}" ]; then
            NIX_EMACS=${SEARCH_RESULT}
            sudo rm /usr/bin/emacs
            sudo ln -s ${NIX_EMACS} /usr/bin/emacs;
            return 0
        fi
    done
    echo "No nix emacs installation found"
    return 1
}

whichkeyboard(){
    KEYBOARD=$( xset -q | grep -A 0 'LED' | cut -c59-67 )
    if [ $KEYBOARD  = 00000000 ]; then
        echo en
    elif [ $KEYBOARD  = 00001000 ]; then
        echo es
    fi
}

switch_sink() {

    # CLI options:  `a2dp': Audio Profile
    #               `hsp':  Telephony Profile
    #               <Index> Default Sink (try `0' or `1')

    SINK=$( pacmd list-cards | grep -B 1 bluez )
    INDEX=$( pacmd list-cards | grep -B 1 bluez | head -1 | awk ' { print $2 } ' )
    SINK=$( pacmd list-cards | grep bluez )
    MAC=$( pacmd list-cards | grep bluez | head -1 | awk -F . ' { print substr($2,0,17) }' )
    BT_SINK="bluez_sink.$MAC"
    BT_SOURCE="bluez_source.$MAC"

    if [ "$1" = a2dp ]; then
        echo Setting A2DP audio sink $BT_SINK
        pacmd set-card-profile $INDEX a2dp_sink
        pacmd set-default-sink $BT_SINK
    elif [ "$1" = hsp ]; then
        echo Setting HSP headset sink $BT_SOURCE
        pacmd set-card-profile $INDEX headset_head_unit
        pacmd set-default-sink $BT_SINK
        pacmd set-default-source $BT_SOURCE
    else
        echo Resetting to internal audio
        pacmd set-default-sink $1
        pacmd set-default-source $1
    fi
}

connect_bluetooth() {
    echo connect 0C:E0:E4:A0:8E:DB | bluetoothctl
}

listen_bluetooth() {
    connect_bluetooth
    sleep 5 && switch_sink a2dp
}

countpage() {
  pdf2dsc "$1" /dev/stdout | grep "Pages" | sed s/[^0-9]//g
}

path() {
  echo $PATH | tr ':' '\n'
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options


# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
test_all() {
    test_installation_all_packages && \
    test_emacs
}
test_emacs() {
    cd spacemacs/.spacemacs.d; cask install; cask exec ecukes --reporter spec
}
test_installation_debian_packages() {
    for package in ${DEBIAN_PACKAGES};
    do
        if ! dpkg -l $package; then
            echo "Package" $package "is not installed"
            return 1
        fi
    done
    return 0
}

test_installation_non_debian_packages() {
    NON_DEBIAN_PACKAGES="simple-mtpfs \
                            emacs \
                           "

    for package in ${NON_DEBIAN_PACKAGES};
    do
        if ! $package --version; then
            echo "Package" $package "is not installed"
            return 1
        fi
    done
    return 0
}

test_installation_all_packages() {
    test_installation_debian_packages && \
    test_installation_non_debian_packages
}
create_checksum_file() {
    echo $(sha512sum ~/dotfiles/scripts/scripts.org) > ~/dotfiles/bash/.bashrc.d/scripts_checksum
}

tangle_scripts () {
    emacs --batch -l org --eval '(org-babel-tangle-file "~/dotfiles/scripts/scripts.org")'
    create_checksum_file
}

case $- in
  *i*)
      sha512sum -c ~/dotfiles/bash/.bashrc.d/scripts_checksum >&/dev/null
      if [ $? -eq 1 ]; then
          tangle_scripts
          echo -e "\n\n\nTangling done\n\n\n"
          source ~/.bashrc
      fi
      ;;
  *) echo "Running in CI";;
esac
