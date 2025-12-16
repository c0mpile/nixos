{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    go
    nodejs
    uv
  ];
}
