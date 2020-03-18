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
