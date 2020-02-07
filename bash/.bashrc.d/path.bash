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

export PATH
