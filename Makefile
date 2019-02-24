.PHONY: all build

all: build buildLinux

build:
	c:\cygwin64\bin\bash buildscript.sh

buildLinux:
	$(shell ./buildscript.sh)
