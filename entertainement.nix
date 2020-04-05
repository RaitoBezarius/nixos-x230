{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol youtube-dl wineFull
    ncmpcpp mpd
    discord syncplay
    (mpv.override {
      waylandSupport = true;
      youtubeSupport = true;
      vaapiSupport = true;
      vdpauSupport = true;
      drmSupport = false; # definitely, I'll pass.
      pulseSupport = true;
    })
  ];
}
