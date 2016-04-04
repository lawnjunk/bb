all: build

build:
	gpp -I lib main.sh -o bb
	chmod 755 bb

clean: 
	rm bb
