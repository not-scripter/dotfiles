{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    git 
    curl
    wget
    nodejs_21
    ripgrep
    lua-language-server
    stylua
    tmux
    ncurses
    lazygit
    ruby
    entr
    zoxide
    colorls
    pass
    typescript
    python3
    fzf
    zsh
    oh-my-posh
    zinit
    neovim

    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.11";

  # Set up nix for flakes
  #nix.extraOptions = ''
  #  experimental-features = nix-command flakes
  #'';

  #time.timeZone = "Europe/Berlin";

  user.shell = "${pkgs.zsh}/bin/zsh";

}

# vim: ft=nix
