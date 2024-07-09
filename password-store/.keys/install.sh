#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Installing password store${ENDCOLOR}"
cd /password-store/.keys
gpg --import private.key
gpg --import public.key
echo -e "${GREEN}Type "trust" > "5"${ENDCOLOR}"
gpg --edit-key mm2922894@gmail.com
cd
