{ pkgs, ... }:
{
  # TODO: add firejails.
  networking.firewall.allowPing = true; # allow to be pinged.
  networking.firewall.enable = true; # enable firewall.
  security.rngd.enable = true; # trust hardware for more entropy.
}
