\ifndef APPEND_TO_FILE
\define APPEND_TO_FILE
append_to_file(){
  local file append
  file="$1"
  append="$2"

  echo "$append" >> "$file"
}
\endif
