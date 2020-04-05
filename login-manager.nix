{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager = {
      lightdm = {
        enable = true;
        greeter.enable = true;
        greeters.enso = {
          enable = true;
          blur = true;
        };
      };
    };
  };
}
