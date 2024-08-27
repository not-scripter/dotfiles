#!/bin/bash
set -e

source ~/dotfiles/install/scripts/animations.sh

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Setup Begins${ENDCOLOR}"
BLA::start_loading_animation "${BLA_modern_metro[@]}"

cmd_prefix=""

#NOTE: with Case 
case "$OSTYPE" in
  # darwin*)  echo "OSX" ;; 
  linux-gnu*)   cmd_prefix="sudo apt" ;;
  linux-android*)   cmd_prefix="pkg" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

if [[ cmd_prefix != "" ]]; then

#NOTE: Common

$cmd_prefix install zsh 
chsh -s zsh 
curl -s https://ohmyposh.dev/install.sh | bash -s
$cmd_prefix install git
$cmd_prefix install curl
$cmd_prefix install wget
$cmd_prefix install nodejs -y
$cmd_prefix install ripgrep
$cmd_prefix install tmux
$cmd_prefix install ncurses-utils
$cmd_prefix install lazygit
$cmd_prefix install ruby
$cmd_prefix install entr
$cmd_prefix install zoxide
$cmd_prefix install pass
gem install colorls
npm install -g eas-cli

#NOTE: Platform Specific

if [[ $OSTYPE == "linux-android" ]]; then
  #NOTE: Neovim
 $cmd_prefix install neovim -y
 elif [[ $OSTYPE == "linux-gnu" ]]; then 
  #NOTE: Neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mkdir -p /opt/nvim
    mv nvim.appimage /opt/nvim/nvim 
    $cmd_prefix install fuse3
    echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc

#NOTE: Nerd-Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv

 fi

else
  echo "OS does not recognised"
fi 

source ~/.zshrc

BLA::stop_loading_animation

# exit 0
trap "echo 'Exiting script'; exit 1" INT
