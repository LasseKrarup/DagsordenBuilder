# Makefile

OUTPUTDIR1 = Z:\Rusture\2019 Sommer\Formandsgruppen\Dagsordener
OUTPUTDIR2 = Z:\Rusture\2019 Sommer\Dagsordner og referater

.PHONY: all clean help latex deploy

all: latex deploy

latex:
ifeq ($(NAME),)
	@echo "Please give the file a name using 'make NAME=<name>'"
else
	@latexmk -pdf main.tex
endif


deploy: latex
ifeq ($(NAME),)
	@echo "Please give the file a name using 'make NAME=<name>'"
else
	cp main.pdf "$(OUTPUTDIR1)\Dagsorden_$(NAME).pdf"
	cp main.pdf "$(OUTPUTDIR2)\Dagsorden_$(NAME).pdf"
endif

clean:
	latexmk -c

help:
	@echo "Build this system using: make NAME=<name>"
