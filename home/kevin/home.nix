{ config, pkgs, ... }:

{
  imports = [
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/nvchad.nix
    ./modules/dev.nix
    ./modules/ghostty.nix
  ];

  home.username = "kevin";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Additional user packages can go here
  ];
  
  # Create basic directories
  home.file.".config/zsh/.gitkeep".text = "";

  # Home Manager should manage itself
  programs.home-manager.enable = true;
}

