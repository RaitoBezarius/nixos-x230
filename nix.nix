{ pkgs, ... }:
{
  # Allow me to build.
  nix.allowedUsers = [ "@wheel" ];
  nix.nixPath = [ 
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/etc/nixos/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
    "/nix/var/nix/profiles/per-user/raito/channels"
  ];

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Do the garbage collection & optimisation daily.
  nix.gc.automatic = true;
  nix.optimise.automatic = true;
}
