#!/bin/bash
#include "extract_functions.sh"
#ifndef MAIN
#define MAIN
main(){
  extract_functions "$1" "$2"
}
main "$1" "$2"
#endif
