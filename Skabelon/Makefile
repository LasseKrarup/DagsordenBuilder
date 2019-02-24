# Makefile

OUTPUTDIR1 = Z:/Rusture/2019 Sommer/Formandsgruppen/Dagsordener
OUTPUTDIR2 = Z:/Rusture/2019 Sommer/Dagsordner og referater
PRINTNAME = $(shell cat name.txt)

.PHONY: all distclean clean help latex deploy name

all: name latex deploy

name:
ifneq ($(NAME),) #if NAME is set...
	@echo "Dagsorden_$(NAME)" > name.txt
else ifeq ($(wildcard name.txt),)
# else if not set and name.txt doesn't exist
	$(error "Please give the file a name using 'make NAME=<name>'")
endif

latex: name
	@latexmk -pdf main.tex -jobname="$(PRINTNAME)"

deploy: latex name
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR1)/$(PRINTNAME).pdf"
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR2)/$(PRINTNAME).pdf"

clean: name
	latexmk -c -jobname="$(PRINTNAME)" main.tex

distclean: name
	latexmk -C -jobname="$(PRINTNAME)" main.tex

help:
	@echo "Build this system using: make NAME=<name>"
