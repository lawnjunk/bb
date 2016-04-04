\ifndef CAT_BETWEEN
\define CAT_BETWEEN
# fn file start_line end_line
cat_between(){ 
  local file start_line end_line
  debug_log "calling func cat_between"
  file="$1"
  start_line="$2"
  end_line="$3"

  sed -n "${start_line},${end_line}p" "$file"
}
\endif
