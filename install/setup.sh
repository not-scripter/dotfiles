#!/bin/bash
set -e

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

branch=""
cmd_prefix=""
repo="https://github.com/not-scripter/dotfiles.git"

while getopts "b:" opt; do
  case $opt in
    b)
      branch="$OPTARG"
      ;;
    *)
      echo "Usage: $0 [-b branch-name] repo"
      exit 1
      ;;
  esac
done

if [ -n "$branch" ]; then
  git clone -b "$branch" "$repo"
else
  git clone "$repo"
fi
# source ~/dotfiles/install/scripts/animations.sh

echo -e "${GREEN}Installing Dependencies${ENDCOLOR}"
# BLA::start_loading_animation "${BLA_modern_metro[@]}"

#NOTE: with Case 
case "$OSTYPE" in
  # darwin*)  echo "OSX" ;; 
  linux-gnu*)   cmd_prefix="sudo apt" ;;
  linux-android*)   cmd_prefix="pkg" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

if [[ cmd_prefix != "" ]]; then

#NOTE: Common

$cmd_prefix install git curl wget zsh nodejs -y ripgrep tmux ruby entr pass
curl -s https://ohmyposh.dev/install.sh | bash -s
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
gem install colorls
npm install -g eas-cli

#NOTE: Platform Specific

if [[ $OSTYPE == "linux-android" ]]; then
chsh -s zsh 
  #NOTE: Termux
  echo -e '$DOTFILES/termux/=$HOME/.termux' > ~/dotfiles/termux/links.prop
  #NOTE: Neovim
 $cmd_prefix install neovim -y lazygit ncurses-utils
  #NOTE: Fonts
  echo -e '$DOTFILES/fonts/font.ttf=$HOME/.termux/font.ttf' > ~/dotfiles/fonts/links.prop

 elif [[ $OSTYPE == "linux-gnu" ]]; then 
sudo chsh -s zsh 
  #NOTE: Neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mkdir -p /opt/nvim
    mv nvim.appimage /opt/nvim/nvim 
    echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc
    $cmd_prefix install fuse3 libncurses5-dev libncursesw5-dev

  #NOTE: LazyGit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

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
