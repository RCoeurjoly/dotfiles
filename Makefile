EMACS ?= emacs
CASK ?= cask

all: test

install:
	bash install.sh
	cd spacemacs/.spacemacs.d; ${CASK}

test:
	cd spacemacs/.spacemacs.d; ${CASK} exec ecukes --no-win

.PHONY:	all install test
