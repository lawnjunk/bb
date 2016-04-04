#!/bin/bash
function rename_macros(){
  sed -i "" "s/${1}include/${2}include/g"  *.sh
  sed -i "" "s/${1}ifndef/${2}ifndef/g"  *.sh 
  sed -i "" "s/${1}define/${2}define/g"  *.sh
  sed -i "" "s/${1}endif/${2}endif/g"  *.sh
  sed -i "" "s/${1}include/${2}include/g"  **/*.sh
  sed -i "" "s/${1}ifndef/${2}ifndef/g"  **/*.sh
  sed -i "" "s/${1}define/${2}define/g"  **/*.sh
  sed -i "" "s/${1}endif/${2}endif/g"  **/*.sh
}
