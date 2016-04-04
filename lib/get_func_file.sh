\include "debug_log.sh"
\include "cat_from_line.sh"
\include "cat_to_line.sh"
\include "macro_maker.sh"
\include "func_definition_start_line.sh"

\ifndef GET_FUNC_FILE
\define GET_FUNC_FILE
#fn file function output_dir
get_func_file(){
  local file func output_dir_base
  local start_line end_line
  local func_file func_tmp_file
  debug_log "calling func get_func_file"
  file="$1"
  func="$2"
  output_dir_base="$3"

  # get the start line 
  start_line=$(func_definition_start_line "$file" "$func")
  debug_log "$(tput setaf 1 ) startline $start_line $(tput sgr0)"

  # write from the startline to the end of the file in a tmp file
  func_tmp_file="${func}.tmp"
  cat_from_line "$file" "$start_line" >> "$func_tmp_file"

  # get the end line
  end_line=$(ag '^}' "$func_tmp_file" |head -n 1 | cut -d ':' -f 1)

  # create the func file
  func_file="${func}.func"
  cat_to_line "$func_tmp_file" "$end_line" > "$func_file"

  # remove the tmp files
  rm "$func_tmp_file"

  macro_maker "$func_file" "$func" "$file" "$output_dir_base"
  rm "$func_file"
}
\endif
