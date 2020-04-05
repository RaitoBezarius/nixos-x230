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
      drmSupport = true; # definitely, I'll pass.
      pulseSupport = true;
      vapoursynthSupport = true;
    }) mpv-with-scripts # let's add some nice scripts.
  ];
}
