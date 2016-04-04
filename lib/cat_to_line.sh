#include "cat_between.sh"
#ifndef CAT_TO_LINE
#define CAT_TO_LINE
#fn file end_line
cat_to_line(){
  local file end_line
  debug_log "calling func cat_to_line"
  file="$1"
  end_line="$2"

  cat_between "$file" "1" "$end_line"
}
#endif
