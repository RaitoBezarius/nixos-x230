{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (signal-desktop.override {
      gtk3 = gtk3.override {
        trackerSupport = false;
      };
    })
  ];
}
