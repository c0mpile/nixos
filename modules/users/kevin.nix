{ config, pkgs, ... }:

{
  users.groups = {
    adbusers = { members = [ "kevin" ]; };
    plugdev  = { members = [ "kevin" ]; };
    greeter  = { members = [ "kevin" ]; };
    docker   = { members = [ "kevin" ]; };
    libvirt  = { members = [ "kevin" ]; };
    storage  = { members = [ "kevin" ]; };
    kevin    = { };
  };

  users.users.kevin = {
    isNormalUser = true;
    description = "Kevin";
    shell = pkgs.zsh;
    group = "kevin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "users"
      "adm"
      "render"
      "kvm"
      "lp"
      "video"
      "audio"
      "systemd-journal"
      "adbusers"
      "plugdev"
      "greeter"
      "docker"
      "libvirt"
      "storage"
    ];
    packages = with pkgs; [
      brave
      vscode
      antigravity
      openrgb-with-all-plugins
      ghostty
      softmaker-office-nx
      kdePackages.konversation
      warehouse
      noto-fonts-cjk-sans
      noto-fonts-emoji-blob-bin
      font-awesome
      eza
      pay-respects
      vesktop
      prismlauncher
    ] ++  (with pkgs.nerd-fonts; [
      cousine
      dejavu-sans-mono
      hack
      jetbrains-mono
      meslo-lg
      symbols-only
      zed-mono
    ]);
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHCunPpL3oYMINqBCT3gOp9QmAPgJsRkWgRk7wnom1lx desktop"
    ];
  };
}