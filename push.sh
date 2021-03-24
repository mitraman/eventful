#!/bin/bash

# update remote git repo

if [ -z "$1" ] 
then
  echo USAGE: push "'comment'"
else
  if [ -z "$git status --porcelain)" ]
  then
    echo "no changes found."
  else  
    git add --all
    git status
    git commit -m"$1"
    git push origin master
  fi  
fi

# eof


