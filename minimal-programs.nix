{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    htop
    acpi
    firefox
    kitty
  ];
}
