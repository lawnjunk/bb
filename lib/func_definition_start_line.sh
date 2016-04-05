\include "debug_log.sh"
\ifndef FUNC_START
\define FUNC_START
# fn file function
func_definition_start_line(){  
  local file func
  debug_log "calling func func_start"
  file="$1"
  func="$2"
  ag "^$func\(\)" "$file" | head -n 1 | cut -d ":" -f 1
}
\endif
