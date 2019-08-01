# -*- mode: sh -*-

function lazygit() {
    CURRENTDIR=$( pwd )
    cd ~/Exocortex
    git add .
    git commit -m "`date`"
    git push
    cd $CURRENTDIR
}

function setkeyboard() {
    setxkbmap -layout us,es
    setxkbmap -option 'grp:rctrl_toggle'
}

function whichkeyboard(){
    KEYBOARD=$( xset -q | grep -A 0 'LED' | cut -c59-67 )
    if [ $KEYBOARD  = 00000000 ]; then
        echo en
    elif [ $KEYBOARD  = 00001000 ]; then
        echo es
    fi
}

function switch_sink() {

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

function connect_bluetooth() {
    echo connect 0C:E0:E4:A0:8E:DB | bluetoothctl
}

function listen_bluetooth() {
    connect_bluetooth
    sleep 5 && switch_sink a2dp
}

function countpage() {
  pdf2dsc "$1" /dev/stdout | grep "Pages" | sed s/[^0-9]//g
}

function path() {
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
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%d/%m/%y %T "

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

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
