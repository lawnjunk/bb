BASH BUD
========

## NAME
**bb** - BASH BUD is late to the party, but brough chips and queso.

## SYNOPSIS
**bb** \[options\] \[source-file-glob\] \[output-dir\]

## DESCRIPTION
Creates unique files for functions in a bash script. Has the ability to remove comments, minify, and add gpp macros.

## OPTIONS

**\-c --no-comments**
**\-g --gpp**

# EXAMPLES
Remove all the functions in *dotfile_manage.sh* wrap them in `gpp` **#ifndef, #define, & #endif** macros, and prepend each file with **#include** macros for dependent functions. Each function will be out put to its own file in the lib directory.  
`bb -g dotfile_manage.sh lib': remove all the functions in _dotfile\_manage.sh_ wrap them in gpp macros 
