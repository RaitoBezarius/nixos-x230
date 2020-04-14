{ pkgs, ... }:
{
  imports = [
    ./modules/spectre_and_meltdown.nix
  ];

  # TODO: add firejails.
  networking.firewall.allowPing = true; # allow to be pinged.
  networking.firewall.enable = true; # enable firewall.
  security.rngd.enable = true; # trust hardware for more entropy.

  security.mitigations.iWantPerformanceRatherThanSecurity = true; # indeed.

  boot.kernel.sysctl = {
    "kernel.dmesg_restrict" = true; # prevent dmesg extraction from non-privileged users
    "kernel.yama.ptrace_scope" = 1; # prevent ptracing
  };

  # DNS
  services.dnscrypt-proxy2.enable = true;
  networking.nameservers = [ "127.0.0.1" "1.1.1.1" "1.0.0.1" ];
  services.dnscrypt-proxy2.settings = {
    sources.public-resolvers = {
      urls = [ "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md" ];
      cache_file = "public-resolvers.md";
      minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      refresh_delay = 72;
    };
  };
}
