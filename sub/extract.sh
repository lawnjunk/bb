\include "functions.sh"
\include "get_function_from_file_async.sh"
\include "warn.sh"
\ifndef EXTRACT
\define EXTRACT
#fn file_glob output_dir

export REMOVE_COMMENTS=1
export ADD_MACROS=1
export REMOVE_WHITESPACE=0
(( "$REMOVE_COMMENTS" == 1 )) && warn "REMOVE_COMMENTS"
(( "$ADD_MACROS" == 1)) &&  warn "ADD_MACROS"
(( "REMOVE_WHITESPACE" == 1)) && warn "REMOVE_WHITESPACE"

extract(){
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
