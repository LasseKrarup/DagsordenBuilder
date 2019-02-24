# Makefile

OUTPUTDIR1 = Z:\Rusture\2019 Sommer\Formandsgruppen\Dagsordener
OUTPUTDIR2 = Z:\Rusture\2019 Sommer\Dagsordner og referater
PRINTNAME = $(shell cat name.txt)

.PHONY: all clean help latex deploy name

all: name latex deploy

name:
ifneq ($(NAME),) #if NAME is set...
	@echo "$(NAME)" > name.txt
else ifeq ($(wildcard name.txt),)
# else if not set and name.txt doesn't exist
	$(error "Please give the file a name using 'make NAME=<name>'")
endif

latex: name
	@latexmk -pdf main.tex -jobname="$(PRINTNAME)"

deploy: latex name
	cp main.pdf "$(OUTPUTDIR1)\Dagsorden_$(PRINTNAME).pdf"
	cp main.pdf "$(OUTPUTDIR2)\Dagsorden_$(PRINTNAME).pdf"

clean:
	latexmk -C

help:
	@echo "Build this system using: make NAME=<name>"
