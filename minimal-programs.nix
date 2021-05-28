{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    htop
    acpi
    firefox
    nmap
    kitty
    xterm
    chromium
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      "gcbommkclmclpchllfjekcdonpmejbdp"
      "naepdomgkenhinolocfifgehidddafch"
    ];

    homepageLocation = "https://duckduckgo.com";

    extraOpts = {
      "BrowserSignin" = 0;
    };
  };
}
