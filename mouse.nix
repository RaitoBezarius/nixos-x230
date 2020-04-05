{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xorg.xf86inputsynaptics
  ];

  hardware.trackpoint.enable = true;

  services.xserver.libinput.enable = false;
  services.xserver.synaptics = {
    accelFactor = "0.4";
    enable = true;
    horizEdgeScroll = true;
    palmDetect = true;
    tapButtons = true;
    vertTwoFingerScroll = true;
    vertEdgeScroll = true;
    buttonsMap = [ 1 3 2 ];
    fingersMap = [ 1 2 3 ];
  };
}
