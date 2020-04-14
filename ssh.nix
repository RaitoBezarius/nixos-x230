{ pkgs, ... }:
{
  programs.ssh.startAgent = true;

  programs.ssh.extraConfig = ''
    Host vieuxtype-builder
      HostName vieux.newtype.fr
      User nix
      IdentityFile ~/.ssh/id_vieuxtype_builder
      IdentitiesOnly yes
  '';
}
