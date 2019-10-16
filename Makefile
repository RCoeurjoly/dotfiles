EMACS ?= emacs
CASK ?= cask

all: test

install:
	bash install.sh
test:
	cd spacemacs/.spacemacs.d; ${CASK} exec ecukes

.PHONY:	all install
