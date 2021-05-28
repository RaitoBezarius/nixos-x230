{ pkgs, ... }:
{
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-switch-on-connect'';

  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = false;
}
