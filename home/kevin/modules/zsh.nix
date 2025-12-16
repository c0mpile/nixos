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
      fi

      # Keybindings for history search
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      # Sudo plugin keybinding (Alt-s)
      bindkey '^[s' sudo-command-line
    '';
  };
}
