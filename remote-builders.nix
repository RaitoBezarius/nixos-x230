{ pkgs, ... }:
{
  programs.ssh.knownHosts = {
    vieuxtype = {
      hostNames = [ "vieuxtype" "vieux.newtype.fr" "51.15.242.178" "10.240.0.1" ];
      publicKeyFile = ./pubkeys/vieuxtype.pub;
    };
  };

  nix.buildMachines = [ {
    hostName = "vieux.newtype.fr";
    sshUser = "nix";
    sshKey = "/root/.ssh/id_vieuxtype_builder";
    systems = [ "x86_64-linux" "aarch64-linux" ];
    maxJobs = 8;
    speedFactor = 4; 
    supportedFeatures = [ "big-parallel" "kvm" ];
  } ];
  
  nix.distributedBuilds = true;
  # The builder will download for me, as it has a lot faster connection than ME.
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
