{ pkgs, ... }:
{
  programs.ssh.startAgent = true;

  programs.ssh.extraConfig = ''
    Host playground-builder
      HostName playground.v6.lahfa.xyz
      User nix
      IdentityFile ~/.ssh/nix_remote_playground
      IdentitiesOnly yes

    Host vieuxtype-builder
      HostName vieux.newtype.fr
      User nix
      IdentityFile ~/.ssh/id_vieuxtype_builder
      IdentitiesOnly yes
  '';
}
