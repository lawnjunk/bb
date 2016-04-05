\define SHEBANG \#!/bin/bash
\SHEBANG
\include "extract.sh"

\ifndef MAIN
\define MAIN

# define global constants
export _FUNCTIONS=()

main(){
  extract "$1" "$2"
  echo "$(tput setaf 3)${_FUNCTIONS[@]}"
}

main "$1" "$2"
\endif
