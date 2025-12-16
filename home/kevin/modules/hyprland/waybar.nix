{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "network" "cpu" "memory" "battery" "tray"];
        
        "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{name}";
        };
        "clock" = {
            format = "{:%H:%M}  ";
            format-alt = "{:%A, %B %d, %Y}  ";
        };
        "cpu" = {
            format = "{usage}% ";
            tooltip = false;
        };
        "memory" = {
            format = "{}% ";
        };
        "battery" = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
        };
        "network" = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "pavucontrol";
        };
      };
    };
    style = ''
        * {
            border: none;
            border-radius: 0;
            font-family: Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
            min-height: 0;
        }
        window#waybar {
            background-color: rgba(43, 48, 59, 0.5);
            border-bottom: 3px solid rgba(100, 114, 125, 0.5);
            color: #ffffff;
            transition-property: background-color;
            transition-duration: .5s;
        }
        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #ffffff;
        }
        #workspaces button:hover {
            background: rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 -3px #ffffff;
        }
        #workspaces button.active {
            background-color: #64727D;
            box-shadow: inset 0 -3px #ffffff;
        }
        #clock, #battery, #cpu, #memory, #disk, #temperature, #backlight, #network, #pulseaudio, #wireplumber, #custom-media, #tray, #mode, #idle_inhibitor, #scratchpad, #mpd {
            padding: 0 10px;
            color: #ffffff;
        }
    '';
  };
}
