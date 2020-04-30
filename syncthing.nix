{ pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "raito";
    group = "users";
    dataDir = "/home/raito/.state/syncthing";
    configDir = "/home/raito/.config/syncthing";
  };
}
