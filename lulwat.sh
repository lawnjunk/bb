#!/bin/bash
functions() 
{
    sed 's/[[:space:];]/\n/g' "$@" |
    grep -E '^[a-zA-Z0-9_-]+()' |
    sed 's/().*$//' | sort -u
}

#fn file_glob output_dir
extract_functions(){
  file_glob="$1"
  for file in $file_glob;do
    echo "found file $file"
    functions "$file"
  done
}

main(){
  extract_functions "$1"
}

main "$1" 
