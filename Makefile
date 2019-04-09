.PHONY: all build nomake change buildLinux nomakeLinux changeLinux

all: build #default - can be changed to another target if needed

###########      ######     #########
###########  Windows builds #########
###########      ######     #########
build:
	c:\cygwin64\bin\bash buildscript.sh make

nomake:
	c:\cygwin64\bin\bash buildscript.sh nomake

change:
	c:\cygwin64\bin\bash makeChange.sh make

###########      ######     #########
###########   Linux builds  #########
###########      ######     #########
buildLinux:
	$(shell ./buildscript.sh make)

nomakeLinux:
	$(shell ./buildscript.sh nomake)

changeLinux:
	$(shell ./makeChange.sh make)

help:
	@echo "build:\t\tBuilds for Windows by default"
	@echo "change:\t\tMake a change to an existing agenda"
	@echo "nomake:\t\tCreates subdirectory and inserts parameters but does not build output files"
	@echo
	@echo "All targets can be used for Linux as well by postfixing the target with 'Linux' ie. buildLinux"
