#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Installing${ENDCOLOR}"
BLA::start_loading_animation "${BLA_modern_metro[@]}"

git clone https://github.com/not-scripter/dotfiles.git
source ~/dotfiles/install/scripts/animations.sh

nix-env -iA nixpkgs.git

nix-env -iA nixpkgs.findutils

bash ~/dotfiles/install/scripts//bootstrap.sh

using nix-env -e findutils
nix-on-droid switch
mkdir /data/data/com.termux.nix/files/usr/lib

source ~/.zshrc

BLA::stop_loading_animation

trap "echo 'Exiting script'; exit 1" INT
