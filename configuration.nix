# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ <nixos-hardware/lenovo/thinkpad/x230>
      ./hardware-configuration.nix
      ./encryption.nix
      ./security.nix
      ./i18n.nix
      ./fonts.nix
      ./minimal-programs.nix
      ./bad-programs.nix
      ./login-manager.nix
      ./power-management.nix
      ./mouse.nix
      ./sway.nix
      ./zsh.nix
      ./network.nix
      ./audio.nix
      ./vim.nix
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "Thorfinn";
  time.timeZone = "Europe/Paris";

  users.users.raito = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
