#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}...Removing the Welcome Screen${ENDCOLOR}"
cd /data/data/com.termux/files/usr/etc
rm motd
cd

echo -e "${GREEN}...Installing Git${ENDCOLOR}"
pkg install git
echo -e "${GREEN}...Installing Curl${ENDCOLOR}"
pkg install curl
echo -e "${GREEN}...Installing Wget${ENDCOLOR}"
pkg install wget -y
echo -e "${GREEN}...Installing NodeJS${ENDCOLOR}"
plg install nodejs -y
echo -e "${GREEN}...Installing Neovim${ENDCOLOR}"
pkg install neovim -y
echo -e "${GREEN}...Installing Neovim Dependencies${ENDCOLOR}"
pkg install ripgrep
pkg install lua-language-server -y
echo -e "${GREEN}...Installing Tmux${ENDCOLOR}"
pkg install tmux
echo -e "${GREEN}...Installing Tmux Dependencies${ENDCOLOR}"
pkg install ncurses-utils
echo -e "${GREEN}...Installing Lazygit${ENDCOLOR}"
pkg install lazygit
echo -e "${GREEN}...Installing Ruby${ENDCOLOR}"
pkg install ruby -y
echo -e "${GREEN}...Installing Entr${ENDCOLOR}"
pkg install entr
echo -e "${GREEN}...Installing Zoxide${ENDCOLOR}"
pkg install zoxide
echo -e "${GREEN}...Installing Cilorls${ENDCOLOR}"
gem install colorls
echo -e "${GREEN}...Installing Pass${ENDCOLOR}"
pkg install pass -y

echo -e "${GREEN}...Installing ZSH shell${ENDCOLOR}"
pkg install zsh -y 
echo -e "${GREEN}...Setting ZSH as default shell${ENDCOLOR}"
chsh -s zsh 

echo -e "${GREEN}...Please Restart Termux${ENDCOLOR}"
