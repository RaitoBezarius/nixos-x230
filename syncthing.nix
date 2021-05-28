{ pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "raito";
    group = "users";
    dataDir = "/home/raito/.state/syncthing";
    configDir = "/home/raito/.config/syncthing";
  };

  boot.kernel.sysctl."fs.inotify.max_user_watches" = 204800;
}
