#!/bin/bash
set -e

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

git clone https://github.com/not-scripter/dotfiles.git
# source ~/dotfiles/install/scripts/animations.sh

echo -e "${GREEN}Installing Dependencies${ENDCOLOR}"
# BLA::start_loading_animation "${BLA_modern_metro[@]}"

cmd_prefix=""

#NOTE: with Case 
case "$OSTYPE" in
  # darwin*)  echo "OSX" ;; 
  linux-gnu*)   cmd_prefix="apt" ;;
  linux-android*)   cmd_prefix="pkg" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

if [[ cmd_prefix != "" ]]; then

#NOTE: Common

$cmd_prefix install git curl wget zsh nodejs -y ripgrep tmux ncurses-utils lazygit ruby entr zoxide pass
chsh -s zsh 
curl -s https://ohmyposh.dev/install.sh | bash -s
gem install colorls
npm install -g eas-cli

#NOTE: Platform Specific

if [[ $OSTYPE == "linux-android" ]]; then
  #NOTE: Neovim
 $cmd_prefix install neovim -y
  #NOTE: Fonts
  echo -e '$DOTFILES/fonts/font.ttf=$HOME/.termux/font.ttf' > ~/dotfiles/fonts/links.prop
 elif [[ $OSTYPE == "linux-gnu" ]]; then 
  #NOTE: Neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mkdir -p /opt/nvim
    mv nvim.appimage /opt/nvim/nvim 
    $cmd_prefix install fuse3
    echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc

  #NOTE: Fonts
  echo -e '$DOTFILES/fonts/=$HOME/.fonts' > ~/dotfiles/fonts/links.prop
fc-cache -fv

 fi

else
  echo "OS does not recognised"
fi 

echo -e "${GREEN}Bootsrapping${ENDCOLOR}"
bash ~/dotfiles/install/scripts/bootstrap.sh

source ~/.zshrc

# BLA::stop_loading_animation

# exit 0
trap "echo 'Exiting script'; exit 1" INT
