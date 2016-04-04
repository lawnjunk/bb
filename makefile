all: build

build:
	gpp -n +s "\"" "\"" "\\" +s "'" "'" "\\" +s "\`" "\`" "\\" -I lib -I sub -I bashful main.sh -o bb
	chmod 755 bb

clean: 
	rm bb

watch:
	find . -name '*.sh' | entr make
