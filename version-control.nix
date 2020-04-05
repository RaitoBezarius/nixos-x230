{ pkgs, ... }:
{
  environment.etc."gitconfig".text = ''
    [user]
      email = masterancpp@gmail.com
      name = Raito Bezarius
    '';
}
