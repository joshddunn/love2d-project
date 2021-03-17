VERSION = 0.0.0

install:
	git submodule update --init --recursive

build:
	zip -9 -r builds/gems-$(VERSION).love . -x ".git/*" -x "builds/*"
