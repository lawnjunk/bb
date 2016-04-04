\ifndef DEBUG_LOG
\define DEBUG_LOG
#fn $@
debug_log(){
  if [[ "$DEBUG" ]];then
    echo "  "$@ >&2
  fi
}
\endif
