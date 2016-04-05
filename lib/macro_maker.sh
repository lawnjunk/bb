\include "upper.sh"
\include "filename.sh"
\include "prepend_to_file.sh"
\include "functions.sh"

\ifndef MACRO_MAKER 
\define MACRO_MAKER 
macro_maker(){
  (
  debug_log "calling func macro_maker"
  local file func_name
  file="$1"
  func_name=$(filename $file)
  echo "functions returned: $func_name"
  func_name_upper=$(echo $func_name |upper)

  prepend_to_file "$file" "\\ifndef $func_name_upper"
  prepend_to_file "$file" "\\define $func_name_upper"
  echo "\\endif" >> "$file"
  ) &
}

\endif
