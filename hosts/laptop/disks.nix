{ config, lib, pkgs, ... }:

{
  boot.initrd.luks.devices."luks-c8af7601-8034-4e03-a289-0733d41eae8e" = {
    device = "/dev/disk/by-uuid/c8af7601-8034-4e03-a289-0733d41eae8e";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  fileSystems."/" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@home" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7656-B346";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/root" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@root" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@nix" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/.snapshots" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@snapshots" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/swap" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@swap" "noatime" "compress=zstd:1" "commit=120" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@log" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/var/cache" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@cache" "compress=zstd:1" "noatime" "commit=120" ];
  };

  fileSystems."/var/lib/docker" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@docker" "noatime" "compress=zstd:1" "commit=120" ];
  };

  fileSystems."/var/lib/containers" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@containers" "noatime" "compress=zstd:1" "commit=120" ];
  };

  fileSystems."/var/lib/libvirt" = {
    device = "/dev/mapper/luks-c8af7601-8034-4e03-a289-0733d41eae8e";
    fsType = "btrfs";
    options = [ "subvol=@libvirt" "noatime" "compress=zstd:1" "commit=120" ];
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/626642da-c96d-4305-93e0-f90035ebd1b5";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" "commit=60" "nofail" "x-systemd.device-timeout=15" ];
  };

  fileSystems."/mnt/downloads" = {
    device = "/dev/disk/by-uuid/b194a135-c0a1-4d27-9995-3e959a0dc645";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" "commit=60" "nofail" "x-systemd.device-timeout=15" ];
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/0f7fd469-0c27-4f22-be25-a704b397fa06";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" "commit=120" "nofail" "x-systemd.device-timeout=15" ];
  };

  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/848b702d-5ed6-4838-90a4-cf141681b7b6";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" "commit=120" "nofail" "x-systemd.device-timeout=15" ];
  };

  swapDevices = [ ];

  systemd.tmpfiles.rules = [
    "d /mnt/storage 0775 kevin users -"
    "d /mnt/downloads 0775 kevin users -"
    "d /mnt/games 0775 kevin users -"
    "d /mnt/media 0775 kevin users -"
  ];
}
