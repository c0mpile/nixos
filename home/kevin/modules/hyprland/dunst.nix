{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#eceff4";
        font = "Droid Sans 9";
      };
      
      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff4";
        timeout = 10;
      };
    };
  };
}
