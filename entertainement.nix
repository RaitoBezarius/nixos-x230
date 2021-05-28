{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol youtube-dl wineFull
    ncmpcpp mpd
    discord # syncplay
    (wrapMpv (mpv-unwrapped.override {
      waylandSupport = true;
      vaapiSupport = true;
      vdpauSupport = true;
      drmSupport = true; # definitely, I'll pass.
      pulseSupport = true;
      vapoursynthSupport = true;
    }) {
      youtubeSupport = true;
    })
  ];
}
