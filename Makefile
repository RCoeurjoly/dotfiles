EMACS ?= emacs26
CASK ?= cask

all: test

install:
	bash install.sh
	cd ~/dotfiles/spacemacs/.spacemacs.d; ${CASK}

test:
	cd ~/dotfiles/spacemacs/.spacemacs.d; ${CASK} exec ecukes --reporter spec

.PHONY:	all install test
