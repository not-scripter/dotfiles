#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Setup Begins...${ENDCOLOR}"

cmd_prefix=""

#NOTE: with Case 
case "$OSTYPE" in
  darwin*)  echo "OSX" ;; 
  linux-gnu*)   cmd_prefix="sudo apt" ;;
  linux-android*)   cmd_prefix="pkg" ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

if [[ cmd_prefix != "" ]]; then
  echo -e "${GREEN}OS: $OSTYPE, CMD: $cmd_prefix${ENDCOLOR}" 
else
  echo "OS does not decognised"
fi 

