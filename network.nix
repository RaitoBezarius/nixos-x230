{ pkgs, ... }:
{
  networking.wireless.enable = true;

  networking.useDHCP = false;
  networking.interfaces.eno0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
}
