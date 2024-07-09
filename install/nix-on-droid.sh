#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

nix-env -iA nixpkgs.findutils
git clone https://github.com/not-scripter/dotfiles.git
bash ~/dotfiles/install/bootstrap.sh
using nix-env -e findutils
nix-on-droid switch
mkdir /data/data/com.termux.nix/files/usr/lib

echo -e "${GREEN}Please Restart Nix-on-Droid${ENDCOLOR}"
