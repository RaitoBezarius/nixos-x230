{ pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/66bf936c-1994-40d0-b6cf-8c9663d5875b";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
