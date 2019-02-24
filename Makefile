.PHONY: all copy

all: copy

copy:
	cp -r Skabelon Dagsorden_Ny
	rm -f Dagsorden_Ny/name.txt
