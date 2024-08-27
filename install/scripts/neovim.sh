#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Installing Neovim [-]"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage 

mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim 

sudo apt-get install fuse3

echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.zshrc

echo "done!"
