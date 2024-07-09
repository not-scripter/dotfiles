# Installation

## Android

- **Termux**

```bash
pkg install git
git clone https://github.com/not-scripter/dotfiles.git
bash ~/dotfiles/install/termux-deps.sh
```

- **Nix-on-droid**

```bash
nix-env -iA nixpkgs.git
bash ~/dotfiles/install/nix-on-droid.sh
```

## Linux

- **Debian, Ubuntu, etc**

```bash
git clone https://github.com/not-scripter/dotfiles.git
bash ~/dotfiles/install/bootstrap.sh
bash ~/dotfiles/install/debian-deps.sh
```

- **Fedora, etc**

```bash
git clone https://github.com/not-scripter/dotfiles.git
bash ~/dotfiles/install/bootstrap.sh
bash ~/dotfiles/install/fedora-deps.sh
```
