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
}
