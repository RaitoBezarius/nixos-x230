{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.security.mitigations;
in
{
  options.security.mitigations = {
    iWantPerformanceRatherThanSecurity = mkOption {
      description = "This will disable all mitigations for side-channels attacks in Linux kernel, e.g. Spectre, Meltdown, MDS, Zombie Load, etc.";
      type = types.bool;
      default = false;
    };
  };

  config = {
    boot.kernelParams = mkIf cfg.iWantPerformanceRatherThanSecurity [
      "noibrs"
      "noibpb"
      "nopti"
      "nospectre_v1"
      "nospectre_v2"
      "l1tf=off"
      "nospec_store_bypass_disable"
      "no_stf_barrier"
      "mds=off"
      "mitigations=off"
    ];
  };
}
