\include "cat_from_line.sh"
\include "cat_to_line.sh"
\include "func_definition_start_line.sh"

\ifndef GET_FUNCTION_FROM_FILE
\define GET_FUNCTION_FROM_FILE
#fn file function output_dir
get_function_from_file(){
  (
  local file func start_line end_line tmp_file
  file="$1"
  func="$2"

  # get the start line 
  start_line=$(func_definition_start_line "$file" "$func")

  # write from the startline to the end of the file in a tmp file
  tmp_file="${func}.tmp"
  cat_from_line "$file" "$start_line" >> "$tmp_file"

  # get the end line
  end_line=$(ag '^}' "$tmp_file" |head -n 1 | cut -d ':' -f 1)

  # cat the function
  if [[ "$REMOVE_COMMENTS" ]];then 
    cat_to_line "$tmp_file" "$end_line" | sed -e 's:#[^"]*$::g' |grep -v "^\s*$" 
  elif [[ "$REMOVE_WHITESPACE" ]];then 
    cat_to_line "$tmp_file" "$end_line" |grep -v "^\s*$" 
  else
    cat_to_line "$tmp_file" "$end_line"
  fi

  # remove the tmp files
  rm "$tmp_file"
  )&
}
\endif
