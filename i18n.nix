{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
  };

  console = {
    keyMap = "fr-latin1";
    font = "Lat2-Terminus16";
  };
}
