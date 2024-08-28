#!/bin/bash
set -e

echo ''

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

branch=""
cmd_prefix=""
repo="https://github.com/not-scripter/dotfiles.git"

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

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

if [ -d "dotfiles" ]; then
  info "Dotfiles already exists. Skipping clone."
else
  if [ -n "$branch" ]; then
    git clone -b "$branch" "$repo"
  else
    git clone "$repo"
  fi
fi
# source ~/dotfiles/install/scripts/animations.sh


#NOTE: with Case 
case "$OSTYPE" in
  # darwin*)  echo "OSX" ;; 
  linux-gnu*)   cmd_prefix="sudo apt" ;;
  linux-android*)   cmd_prefix="pkg" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

common_deps () {
  $cmd_prefix install git curl wget zsh nodejs -y ripgrep tmux ruby entr pass
  curl -s https://ohmyposh.dev/install.sh | bash -s
  gem install colorls
  npm install -g eas-cli
}
android_deps () {
  chsh -s zsh 
  echo -e '$DOTFILES/termux/=$HOME/.termux' > ~/dotfiles/termux/links.prop
  $cmd_prefix install neovim -y lazygit ncurses-utils zoxide
  echo -e '$DOTFILES/fonts/font.ttf=$HOME/.termux/font.ttf' > ~/dotfiles/fonts/links.prop
}
linux_deps () {
  # sudo chsh -s zsh 
  $cmd_prefix install fuse3 libncurses5-dev libncursesw5-dev
  #NOTE: Zoxide
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  #NOTE: Neovim
if [ -d "/opt/nvim" ]; then
  info "Directory /opt/nvim already exists. Skipping clone."
else
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  mkdir -p /opt/nvim
  mv nvim.appimage /opt/nvim/nvim 
  echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc
fi
  #NOTE: LazyVim
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  #NOTE: Fonts
  echo -e '$DOTFILES/fonts/=$HOME/.fonts' > ~/dotfiles/fonts/links.prop
  fc-cache -fv
}

# install_deps () {
#   info "Installing Dependencies"
#   if [[ cmd_prefix != "" ]]; then 
#     # common_deps
#     if [[ $OSTYPE == "linux-android" ]]; then  
#       android_deps
#     elif [[ $OSTYPE == "linux-gnu" ]]; then 
#       linux_deps
#     fi
#   else
#     fail "OS does not recognised"
#   fi 
# }

bootstrap () {
  info "Bootstrapping"
  bash ~/dotfiles/install/scripts/bootstrap.sh
}

# BLA::start_loading_animation "${BLA_modern_metro[@]}"
# install_deps 
info "Installing Dependencies"
if [[ cmd_prefix != "" ]]; then 
  # common_deps
  if [[ $OSTYPE == "linux-android" ]]; then  
    android_deps
  elif [[ $OSTYPE == "linux-gnu" ]]; then 
    linux_deps
  fi
else
  fail "OS does not recognised"
fi 
bootstrap
source ~/.zshrc
# BLA::stop_loading_animation

# exit 0
# trap "echo 'Exiting script'; exit 1" INT
echo ''
echo ''
success 'All installed! Shamno Varunah'
