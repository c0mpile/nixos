{ config, pkgs, ... }:

{
  xdg.configFile."ghostty/config".text = ''
    confirm-close-surface = false
  '';
}
