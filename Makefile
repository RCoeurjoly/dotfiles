EMACS ?= emacs26
CASK ?= cask

all: test

install:
	bash install_all.sh
	cd spacemacs/.spacemacs.d; ${CASK}

test:
	cd spacemacs/.spacemacs.d; ${CASK} exec ecukes --reporter spec

.PHONY:	all install test
