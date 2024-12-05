# -----------------------------------------------------
# Install packages
# -----------------------------------------------------

installer_packages=(
  "alsa-utils"
  # "alsa-firmware"
  # "alsa-plugins"
  "git"
  "wget"
  "unzip"
  "zsh"
  "nodejs"
  "npm"
  "fzf"
  "zoxide"
  "neovim"
  "ttf-font-awesome"
  "pavucontrol"
  "ark"
  "kwrite"
  "mpv"
  "elisa"
  "blueman"
  "polkit"
  "xdg-desktop-portal-hyprland"
  "xdg-desktop-portal-gtk"
  # "iwd"
  # "iwgtk"
  "gvfs"
  "thunar"
  "thunar-volman"
  "ranger"
  "keyd" # sudo systemctl enable keyd
  "zenity"
  "ufw" # sudo ufw enable # sudo ufw allow 3389/tcp
  "xrdp" # sudo systemctl enable xrdp
  "xorgxrdb"
  "ddcutil" # sudo usermod -G i2c -a user
  "ddcui"
  "gimp"
  "libreoffice-fresh"

  "arc-gtk-theme"
  # "lxappearance"
  # "qt5ct"
  "kvantum"
  "kvantum-qt5"
  "dconf-editor"

  "webcord"
  "coreimage"
  "yt-dlp"

  "waybar"
  "hyprpaper"
  "hyprlock"
  "hypridle"

  "arduino-cli"
  "kicad-library"
  "scrapy"
  "minicom"
)

installer_yay=(
  "wlogout"
  "hyprshot"
  "xremap-x11-bin"
  "hyprpolkitagent-git"

  "amberol"

  "postman"
  # "bun" >600mb

  "microsoft-edge-stable-bin"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

