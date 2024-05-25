#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}...Installing ZSH shell${ENDCOLOR}"
apt install zsh 
echo -e "${GREEN}...Setting ZSH as default shell${ENDCOLOR}"
chsh -s zsh 

echo -e "${GREEN}...Installing Git${ENDCOLOR}"
apt install git
echo -e "${GREEN}...Installing Curl${ENDCOLOR}"
apt install curl
echo -e "${GREEN}...Installing Wget${ENDCOLOR}"
apt install wget
echo -e "${GREEN}...Installing NodeJS${ENDCOLOR}"
plg install nodejs -y
echo -e "${GREEN}...Installing Neovim${ENDCOLOR}"
apt install neovim -y
echo -e "${GREEN}...Installing Neovim Dependencies${ENDCOLOR}"
apt install ripgrep
echo -e "${GREEN}...Installing Tmux${ENDCOLOR}"
apt install tmux
echo -e "${GREEN}...Installing Tmux Dependencies${ENDCOLOR}"
apt install ncurses-utils
echo -e "${GREEN}...Installing Lazygit${ENDCOLOR}"
apt install lazygit
echo -e "${GREEN}...Installing Ruby${ENDCOLOR}"
apt install ruby
echo -e "${GREEN}...Installing Entr${ENDCOLOR}"
apt install entr
echo -e "${GREEN}...Installing Zoxide${ENDCOLOR}"
apt install zoxide
echo -e "${GREEN}...Installing Cilorls${ENDCOLOR}"
gem install colorls
echo -e "${GREEN}...Installing Pass${ENDCOLOR}"
apt install pass

echo -e "${GREEN}...Please Restart Termux${ENDCOLOR}"
