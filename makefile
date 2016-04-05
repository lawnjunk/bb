all: build

build: 
	gpp +s "\"" "\"" "\\" +s "'" "'" "\\" +s "\`" "\`" "\\" -U "\\" "" "(" "," ")" "(" ")" "#" "\\" -M "\\" "\n" " " " " "\n" "(" ")" -I sub -I bashful -I lib main.sh -o bb
	awk 'NF' bb > no_white_space
	mv no_white_space bb
	chmod 755 bb
	fortune

run: clean build
	./bb bb tmp

clean: 
	rm bb
	rm -rf tmp

watch:
	find . -name '*.sh' | entr -c make 

	#gpp -n +c "#" "\n" +s "\"" "\"" "\\" +s "'" "'" "\\" +s "\`" "\`" "\\" -U "\\" "" "(" "," ")" "(" ")" "#" "\\" -M "\\" "\n" " " " " "\n" "(" ")" -I sub -I bashful -I lib main.sh -o bb
