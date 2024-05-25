#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}...Installing ZSH shell${ENDCOLOR}"
dnf install zsh 
echo -e "${GREEN}...Setting ZSH as default shell${ENDCOLOR}"
chsh -s zsh 

echo -e "${GREEN}...Installing Git${ENDCOLOR}"
dnf install git
echo -e "${GREEN}...Installing Curl${ENDCOLOR}"
dnf install curl
echo -e "${GREEN}...Installing Wget${ENDCOLOR}"
dnf install wget
echo -e "${GREEN}...Installing NodeJS${ENDCOLOR}"
plg install nodejs -y
echo -e "${GREEN}...Installing Neovim${ENDCOLOR}"
dnf install neovim -y
echo -e "${GREEN}...Installing Neovim Dependencies${ENDCOLOR}"
dnf install ripgrep
echo -e "${GREEN}...Installing Tmux${ENDCOLOR}"
dnf install tmux
echo -e "${GREEN}...Installing Tmux Dependencies${ENDCOLOR}"
dnf install ncurses-utils
echo -e "${GREEN}...Installing Lazygit${ENDCOLOR}"
dnf install lazygit
echo -e "${GREEN}...Installing Ruby${ENDCOLOR}"
dnf install ruby
echo -e "${GREEN}...Installing Entr${ENDCOLOR}"
dnf install entr
echo -e "${GREEN}...Installing Zoxide${ENDCOLOR}"
dnf install zoxide
echo -e "${GREEN}...Installing Cilorls${ENDCOLOR}"
gem install colorls
echo -e "${GREEN}...Installing Pass${ENDCOLOR}"
dnf install pass

echo -e "${GREEN}...Please Restart Termux${ENDCOLOR}"
