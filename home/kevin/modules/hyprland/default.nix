{ config, pkgs, inputs, ... }:
{
  imports = [
    ./waybar.nix
    ./dunst.nix
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpaper.jpg
    wallpaper = ,~/Pictures/wallpaper.jpg
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    
    # Use system package (enabled in NixOS module via Flake)
    package = null;
    portalPackage = null;

    # Plugins (Infrastructure enabled)
    # Adding hyprbars as a demonstration/standard plugin since "configured and working properly" was requested.
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];

    settings = {
      # ==================
      # MONITOR CONFIG
      # ==================
      monitor = [
        "DP-1, 2560x1440@165, 0x0, 1"
        "DP-2, 2560x1440@165, 2560x0, 1"
      ];

      # ==================
      # ENVIRONMENT VARS
      # ==================
      env = [
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "QT_QPA_PLATFORMTHEME,gtk3"
        "QT_QPA_PLATFORMTHEME_QT6,gtk3"
        "TERMINAL,ghostty" # Primary terminal
        "XCURSOR_THEME,BreezeX-Black"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,BreezeX-black-hyprcursor"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
      ];

      # ==================
      # STARTUP APPS
      # ==================
      exec-once = [
        "hyprpaper"
        "waybar"
        "dunst"
        "hypridle"
        "systemctl --user start hyprpolkitagent"
        "bash -c \"wl-paste --watch cliphist store &\""
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" # Fallback
        "/run/current-system/sw/bin/kwalletd5"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      # ==================
      # INPUT CONFIG
      # ==================
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        sensitivity = 0;
        accel_profile = "flat";
      };

      # ==================
      # GENERAL LAYOUT
      # ==================
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 0;
        "col.active_border" = "rgba(707070ff)";
        "col.inactive_border" = "rgba(d0d0d0ff)";
        layout = "dwindle";
      };

      # ... (omitted decoration/animations/layouts/misc/windowrulev2)

      # ==================
      # KEYBINDINGS
      # ==================
      "$mod" = "SUPER";

      bind = [
        # === Application Launchers ===
        "$mod, Return, exec, ghostty"       # Standard terminal (Ghostty)
        "$mod SHIFT, Return, exec, kitty"   # Secondary terminal (Kitty)
        "$mod, B, exec, brave"
        "$mod, E, exec, ghostty -e yazi"
        "$mod SHIFT, E, exec, ghostty -e nvim"
        "$mod CTRL, E, exec, nautilus -w"
        "$mod CTRL, Q, exec, nautilus -q"
        "$mod, P, exec, brave --app=\"https://perplexity.ai\""
        "$mod SHIFT, P, exec, brave --app=\"https://mail.proton.me\""
        "$mod SHIFT, T, exec, brave --app=\"https://t.ytmnd.me\""
        "$mod CTRL, A, exec, brave --app=\"https://abs.ytmnd.me\""
        "$mod CTRL, H, exec, brave --app=\"https://hoopladigital.com\""

        # === Hypr Ecosystem Tools ===
        "$mod, space, exec, rofi -show drun"       # Launcher
        "$mod, V, exec, rofi -modi clipboard:cliphist-rofi-img -show clipboard" # Clipboard
        "$mod SHIFT, C, exec, hyprpicker -a"       # Color picker (Color to clipboard)
        "$mod SHIFT, L, exec, hyprlock"            # Lock screen
        "$mod, Escape, exec, wlogout"              # Logout menu
        "$mod CTRL, X, exec, wlogout"              # Logout menu (Alternate)
        
        # === Screenshots (Hyprshot) ===
        ", XF86Launch1, exec, hyprshot -m region"
        "CTRL, XF86Launch1, exec, hyprshot -m output"
        "ALT, XF86Launch1, exec, hyprshot -m window"
        ", Print, exec, hyprshot -m region"
        "CTRL, Print, exec, hyprshot -m output"
        "ALT, Print, exec, hyprshot -m window"

        # === Window Management ===
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 1"
        "$mod SHIFT, F, fullscreen, 0"
        "$mod, T, togglefloating"
        "$mod, W, togglegroup"

        # === Focus Navigation ===
        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # === Window Movement ===
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, down, movewindow, d"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        # === Column Navigation ===
        "$mod, Home, focuswindow, first"
        "$mod, End, focuswindow, last"

        # === Monitor Navigation ===
        "$mod CTRL, left, focusmonitor, l"
        "$mod CTRL, right, focusmonitor, r"
        "$mod CTRL, H, focusmonitor, l"
        "$mod CTRL, L, focusmonitor, r"

        # === Move to Monitor ===
        "$mod SHIFT CTRL, left, movewindow, mon:l"
        "$mod SHIFT CTRL, down, movewindow, mon:d"
        "$mod SHIFT CTRL, up, movewindow, mon:u"
        "$mod SHIFT CTRL, right, movewindow, mon:r"
        "$mod SHIFT CTRL, H, movewindow, mon:l"
        "$mod SHIFT CTRL, L, movewindow, mon:r"

        # === Workspace Navigation ===
        "$mod, Page_Down, workspace, e+1"
        "$mod, Page_Up, workspace, e-1"
        "$mod, U, workspace, e+1"
        "$mod, I, workspace, e-1"
        "$mod CTRL, down, movetoworkspace, e+1"
        "$mod CTRL, up, movetoworkspace, e-1"
        "$mod CTRL, U, movetoworkspace, e+1"
        "$mod CTRL, I, movetoworkspace, e-1"

        # === Move Workspaces ===
        "$mod SHIFT, Page_Down, movetoworkspace, e+1"
        "$mod SHIFT, Page_Up, movetoworkspace, e-1"
        "$mod SHIFT, U, movetoworkspace, e+1"
        "$mod SHIFT, I, movetoworkspace, e-1"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod CTRL, mouse_down, movetoworkspace, e+1"
        "$mod CTRL, mouse_up, movetoworkspace, e-1"

        # === Numbered Workspaces ===
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # === Move to Numbered Workspaces ===
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 10, movetoworkspace, 10"

        # === Column Management ===
        "$mod, bracketleft, layoutmsg, preselect l"
        "$mod, bracketright, layoutmsg, preselect r"

        # === Sizing & Layout ===
        "$mod, R, layoutmsg, togglesplit"
        "$mod CTRL, F, resizeactive, exact 100%"
      ];

      # === Audio Controls ===
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      # === Mouse Bindings ===
      bindmd = [
        "$mod, mouse:272, Move window, movewindow"
        "$mod, mouse:273, Resize window, resizewindow"
      ];

      bindd = [
        "$mod, code:20, Expand window left, resizeactive, -100 0"
        "$mod, code:21, Shrink window left, resizeactive, 100 0"
      ];

      binde = [
        "$mod, minus, resizeactive, -10% 0"
        "$mod, equal, resizeactive, 10% 0"
        "$mod SHIFT, minus, resizeactive, 0 -10%"
        "$mod SHIFT, equal, resizeactive, 0 10%"
      ];
      
      # === Plugin Configuration ===
      plugin = {
        hyprbars = {
            # Example config
            bar_height = 20;
            bar_color = "rgb(1e1e1e)";
            col.text = "rgb(ffffff)";
        };
      };
    };
    
    systemd.variables = ["--all"];
  };
}
