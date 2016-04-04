all: build

build:
	gpp -n +c "#" "\n" +s "\"" "\"" "\\" +s "'" "'" "\\" +s "\`" "\`" "\\" -U "\\" "" "(" "," ")" "(" ")" "#" "\\" -M "\\" "\n" " " " " "\n" "(" ")" -I sub -I bashful -I lib main.sh -o bb
	awk 'NF' bb > no_white_space
	mv no_white_space bb
	chmod 755 bb

clean: 
	rm bb

watch:
	find . -name '*.sh' | entr make
