#include "cat_between.sh"
#include "trim.sh"
#ifndef CAT_FROM_LINE
#define CAT_FROM_LINE
#fn file star_line
cat_from_line(){
  local file start_line end_line
  debug_log "calling func cat_from_line"
  file="$1"
  start_line="$2"
  end_line=$(wc -l "$file" | trim | cut -d ' ' -f 1)

  cat_between "$file" "$start_line" "$end_line"
}
#endif
