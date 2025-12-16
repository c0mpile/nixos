{ config, pkgs, ... }:

{
  home.username = "kevin";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Additional user packages can go here
  ];

  # Enable programs.zsh at user level (plain zsh, no frameworks)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  # Git configuration
  programs.git.enable = true;
  programs.git.settings.user.name = "c0mpile";
  programs.git.settings.user.email = "c0mpile@disroot.org";

  # Create basic directories
  home.file.".config/zsh/.gitkeep".text = "";

  # Home Manager should manage itself
  programs.home-manager.enable = true;
}
