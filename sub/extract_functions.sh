#include "functions.sh"
#ifndef EXTRACT_FUNCTIONS
#define EXTRACT_FUNCTIONS
#fn source_file dest_dir
extract_functions(){
  local source_file dest_dir
  source_file="$1"
  dest_dir="$2"
  [[ -d "$dest_dir" ]] || mkdir "$dest_dir"
}
#endif

