{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    rsync
    curl
    tmux
    fastfetch
    btop
    zsh
    git
    snapper
    btrfs-progs
    android-tools
    yazi
    cargo
    rustc
    protonvpn-gui
    lua-language-server
    ripgrep
    fd
    zoxide
    fzf
    p7zip
    flatpak
    greetd
    tuigreet
    home-manager
    kdePackages.flatpak-kcm
    kdePackages.discover
  ];
}
