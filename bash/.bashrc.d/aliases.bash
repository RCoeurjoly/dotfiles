# -*- mode: sh -*-

alias dc="docker-compose"
alias clangcmakepp="CXX='clang_complete_args.py g++' cmake .."
alias clangcmakecc="CXX='clang_complete_args.py gcc' cmake .."
alias gatherclangcomplete="find .. | ag clang_complete | xargs cat | sort | uniq > ../.clang_complete"
alias clangcompletepp="clangcmakepp && make && gatherclangcomplete"
alias clangcompletecc="clangcmakecc && make && gatherclangcomplete"
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

# Do the thing in bash instead of initrc

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
