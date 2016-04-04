\include "upper.sh"
\include "filename.sh"
\ifndef MACRO_MAKER 
\define MACRO_MAKER 
macro_maker(){
  debug_log "calling func macro_maker"
  local file func_name source_file output_dir_base
  local source_file_dir_name output_dir func_name_upper
  local gpp_file
  file="$1"
  func_name="$2"
  source_file="$3"
  output_dir_base="$4"

  source_file_dir_name=$(filename "$source_file");
  output_dir="${output_dir_base}/${source_file_dir_name}"

  func_name_upper=$(echo $func_name |upper)

  gpp_file="${output_dir}/${func_name}.sh"

  [[ -d "$output_dir" ]] || mkdir "$output_dir"
  touch "$gpp_file"
  echo -n "#" >> "$gpp_file"
  echo "\ifndef $func_name_upper" >> "$gpp_file"
  echo -n "#"                    >> "$gpp_file"
  echo "\define $func_name_upper" >> "$gpp_file"
  cat "$file"                    >> "$gpp_file"
  echo -n "#"                    >> "$gpp_file"
  echo "\endif"                   >> "$gpp_file"
}

\endif
