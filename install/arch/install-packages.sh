# -----------------------------------------------------
# Install packages
# -----------------------------------------------------

installer_packages=(
  "git"
  "wget"
  "unzip"
  "zsh"
  "nodejs"
  "npm"
  "fzf"
  "zoxide"
  "neovim"
  "waybar"
  "hyprpaper"
  "hyprlock"
  "ttf-font-awesome"
  "pavucontrol"
)

installer_yay=(
  "wlogout"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

