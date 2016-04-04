#include "functions.sh"
#ifndef EXTRACT_FUNCTIONS
#define EXTRACT_FUNCTIONS
#fn file_glob output_dir
extract_functions(){
  file_glob="$1"
  output_dir_base="$2"
  [[ -d "$output_dir_base" ]] || mkdir "$output_dir_base"
  for file in $file_glob;do
    echo "$file"
    functions_found=$(functions "$file")
    echo "$functions_found"
      #get_func_file "$file" "$func" "$output_dir_base"
  done
}
#endif
