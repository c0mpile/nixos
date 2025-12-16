{ config, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    rsync
    curl
    tmux
    fastfetch
    btop
    bat
    tree
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
    unzip
    flatpak
    kitty
    ghostty
    rofi
    wlogout
    waybar
    dunst
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
    hyprshot
    hyprpolkitagent
    libsForQt5.kwallet
    kdePackages.kwallet-pam
    home-manager
    kdePackages.flatpak-kcm
    kdePackages.discover
    inputs.hyprwayland-scanner.packages.${pkgs.system}.default
    inputs.hyprland-guiutils.packages.${pkgs.system}.default
  ];
}
