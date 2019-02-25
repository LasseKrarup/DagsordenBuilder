.PHONY: all build buildLinux nomake afbud kommentarer

all: build

build:
	c:\cygwin64\bin\bash buildscript.sh make

buildLinux:
	$(shell ./buildscript.sh make)

nomake:
	c:\cygwin64\bin\bash buildscript.sh nomake

afbud:
	c:\cygwin64\bin\bash addAfbudScript.sh make

comment:
	c:\cygwin64\bin\bash addCommentScript.sh make


help:
	echo "build:\t\tBuilds for Windows by default"
	echo "buildLinux:\t\tBuilds for Linux"
	echo "nomake:\t\tCreates subdirectory and inserts parameters but does not build output files"
