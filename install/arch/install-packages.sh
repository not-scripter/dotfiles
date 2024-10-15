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
  "waybar"
  "hyprpaper"
  "hyprlock"
  "hypridle"
)

installer_yay=(
  "wlogout"
  "hyprshot"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

