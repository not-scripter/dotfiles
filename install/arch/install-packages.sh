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
  "yt-dlp"

  "arc-gtk-theme"
  # "lxappearance"
  # "qt5ct"
  "kvantum"
  "kvantum-qt5"

  "webcord"
  "coreimage"

  "waybar"
  "hyprpaper"
  "hyprlock"
  "hypridle"
)

installer_yay=(
  "wlogout"
  "hyprshot"
  "xremap-x11-bin"

  "amberol"

  "postman"
  # "bun" >600mb

  "microsoft-edge-stable-bin"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

