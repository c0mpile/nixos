{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      ll = "eza -l --icons --git -a";
      lt = "eza --tree --level=2 --long --icons --git";
    };

    antidote = {
      enable = true;
      plugins = [
        "romkatv/powerlevel10k"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/sudo"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"
        "zsh-users/zsh-completions"
        "Aloxaf/fzf-tab"
        "MichaelAquilina/zsh-autoswitch-virtualenv"
        "nix-community/nix-zsh-completions"
        "chisui/zsh-nix-shell"
      ];
    };

    initContent = ''
      # Source Powerlevel10k config
      if [[ -r "${./zsh/p10k.zsh}" ]]; then
        source "${./zsh/p10k.zsh}"
        
        if [[ "''${LC_ALL:-''${LC_CTYPE:-$LANG}}" =~ "UTF-8" ]] && (( ''${terminfo[colors]:-0} >= 256 )); then
          # High capabilities: Use prompt loop with NO icons
          typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=""
          typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=""
          typeset -g POWERLEVEL9K_LOCK_ICON=""
        else
          # Low capabilities: ASCII mode with ANSI colors
          typeset -g POWERLEVEL9K_MODE=ascii
          typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION=">"
          typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION=">"
          typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_CONTENT_EXPANSION="<"
          typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VICMD_CONTENT_EXPANSION="<"
          typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=""
          
          # Colors (ANSI)
          typeset -g POWERLEVEL9K_DIR_FOREGROUND=4
          typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=2
          typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=1
        fi
      fi

      # Keybindings for history search
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      # Sudo plugin keybinding (Alt-s)
      bindkey '^[s' sudo-command-line
    '';
  };
}
