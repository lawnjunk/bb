\include "functions.sh"
\include "get_function_from_file.sh"
\include "remove_whitespace_from_file.sh"
\include "remove_comments_from_file.sh"
\ifndef EXTRACT_FUNCTIONS
\define EXTRACT_FUNCTIONS
#fn file_glob output_dir
#export REMOVE_COMMENTS=true
export REMOVE_WHITESPACE=true

extract_functions(){
  local file functions_in_file output_dir output_file
  file_glob="$1"
  output_dir="$2"
  [[ -d "$output_dir" ]] || mkdir "$output_dir"
  for file in $file_glob;do
    functions_in_file=$(functions "$file")
    for func in $(echo "$functions_in_file");do
      _FUNCTIONS+=("$func")
      (
      output_file="${output_dir}/${func}.sh"
      get_function_from_file "$file" "$func" >> "$output_file" 
      ) &
    done
  done
  wait
}
\endif
