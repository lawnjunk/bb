\include "functions.sh"
\include "get_function_from_file_async.sh"
\include "warn.sh"
\ifndef EXTRACT_FUNCTIONS
\define EXTRACT_FUNCTIONS
#fn file_glob output_dir

export REMOVE_COMMENTS=true
warn "REMOVE_COMMENTS: $REMOVE_COMMENTS"
#export REMOVE_WHITESPACE=false
#warn "REMOVE_WHITESPACE: $REMOVE_WHITESPACE"

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
      get_function_from_file_async "$file" "$func" >> "$output_file" 
      ) &
    done
  done
  wait
}
\endif
