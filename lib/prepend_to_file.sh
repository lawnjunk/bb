\ifndef PREPEND_TO_FILE
\define PREPEND_TO_FILE
prepend_to_file(){
  local file tmp_file prepend
  file="$1"
  prepend="$2"
  tmp_file="${file}_${RANDOM}.tmp"

  echo "$prepend" > "$tmp_file"
  cat "$file" >> "$tmp_file"
  mv "$tmp_file" "$file"
}
\endif 
