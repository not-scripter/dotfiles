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

  "amberol"

  "postman"

  "microsoft-edge-stable-bin"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

