{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user.name = "c0mpile";
      user.email = "c0mpile@disroot.org";
      
      alias = {
        s = "status";
        co = "checkout";
        cm = "commit";
        br = "branch";
        df = "diff";
        lg = "log --graph --oneline --decorate --all";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}

