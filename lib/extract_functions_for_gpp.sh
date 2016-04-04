#include "get_func_file.sh"
#ifndef EXTRACT_FUNCTIONS_FOR_GPP
#define EXTRACT_FUNCTIONS_FOR_GPP
#fn file_glob output_dir
extract_functions_for_gpp(){
  loop_target="$1"
  output_dir_base=$(relpath "$2")
  [[ -d "$output_dir_base" ]] || mkdir "$output_dir_base"
  for file in $(echo $loop_target);do
    echo "$file"
    for func in $(functions "$file");do
      echo "function: ${func}"
      get_func_file "$file" "$func" "$output_dir_base"
    done
  done
}
#endif
