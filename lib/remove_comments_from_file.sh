\ifndef REMOVE_COMMENTS_FROM_FILE
\define REMOVE_COMMENTS_FROM_FILE
#fn $file
remove_comments_from_file(){
  local file tmp_file
  file="$1"
  tmp_file="$file_$RANDOM.tmp"
  touch "$tmp_file" 
  sed 's:#[^"]*$::g' "$file" > "$tmp_file"
  mv "$tmp_file" "$file"
}
\endif

