.PHONY: all build buildLinux

all: build

build:
	c:\cygwin64\bin\bash buildscript.sh

buildLinux:
	$(shell ./buildscript.sh)
