# -----------------------------------------------------
# Install packages
# -----------------------------------------------------

installer_packages=(
	"os-prober"
	"alsa-utils" #alsamixer
	# "alsa-firmware"
	# "alsa-plugins"
	"git"
	"wget"
	"zsh" # chsh -s $(which zsh)
	"fzf"
	"zoxide"
	"ttf-font-awesome"
	"pavucontrol"
	"ark"
	# "kwrite"
	# "mpv"
	# "elisa"
	"blueman"
	# "polkit"
	"xdg-desktop-portal-hyprland"
	#"xdg-desktop-portal-gtk"
	# "iwd"
	# "iwgtk"
	"gvfs" #thunar dep
	"thunar"
	"thunar-volman"
	"thunar-archive-plugin"
	"ranger"
	"keyd" # sudo systemctl enable keyd
	# "zenity"
	# "ufw" # sudo ufw enable # sudo ufw allow 3389/tcp
	# "xrdp" # sudo systemctl enable xrdp
	# "xorgxrdb"
	"ddcutil" # sudo usermod -G i2c -a user
	"rofi"
	"waybar"
	"hyprpaper"
	"hyprlock"
	"hypridle"
	"minicom"
	"nodejs"
	"npm"
	# "arc-gtk-theme"
	# "lxappearance"
	# "qt5ct"
	"kvantum"
	"kvantum-qt5"
	"dconf-editor"
	"base-devel" # git clone https://aur.archlinux.org/yay.git   cd yay    makepkg -si
)

installer_yay=(
	"ddcui"
	"wlogout"
	"hyprshot"
	"xremap-x11-bin"
	"hyprpolkitagent-git"
	"neovim-git"
	"yazi-git"
)

installer_packages_extra=(
	"gimp"
	"libreoffice-fresh"
	"webcord"
	"coreimage"
	"yt-dlp"
	"arduino-cli"
	"kicad-library"
	"scrapy"
)
installer_yay_extra=(
	# "amberol"
	# "postman"
	# "bun" >600mb
	"zen-browser-bin"
	"microsoft-edge-dev-bin"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";

_installPackages "${installer_packages_extra[@]}";
_installPackagesYay "${installer_yay_extra[@]}";

