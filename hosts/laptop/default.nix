{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ./hardware.nix
    ./disks.nix
    ./configuration.nix
    ../../modules/users/kevin.nix
  ];
}
