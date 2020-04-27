{ pkgs, ... }:
let
  iconTheme = pkgs.breeze-icons.out;
  themeEnv = ''
    # Qt: remove local overrides
    rm -f ~/.config/Trolltech.conf

    # GTK3: remove local overrides
    rm -f ~/.config/tk-3.0/settings.ini

    # GTK3: use global theme
    export XDG_DATA_DIRS="${pkgs.gnome-breeze}/share:$XDG_DATA_DIRS"

    # GTK3: add /etc/xdg/gtk-3.0 to search path
    export XDG_CONFIG_DIRS="$/etc/xdg:$XDG_CONFIG_DIRS"

    # GTK2 theme & icon theme
    # export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="papirus"''}:${pkgs.breeze-gtk}/share/themes/Breeze/gtk-2.0/gtkrc:$GTK2_RC_FILES

    # SVG loader for pixbuf
    export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)

    # Qt:
    export QT_STYLE_OVERRIDE=breeze
'';
in
{
  environment.extraInit = ''
    ${themeEnv}
  
    # Defaults.
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CACHE_HOME=$HOME/.cache
  '';

  environment.etc."xdg/Trolltech.conf" = {
    text = ''
      [Qt]
      style=Breeze
    '';
    mode = "444";
  };

  environment.etc."xdg/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-icon-theme-name=breeze
      gtk-theme-name=Breeze-gtk
    '';
    mode = "444";
  };

  environment.systemPackages = with pkgs; [
    # Breeze
    breeze-grub
    breeze-qt5

    # Icons (main)
    iconTheme

    # Icons (fallback)
    gnome3.adwaita-icon-theme
    hicolor_icon_theme

    # Tray
    libappindicator-gtk3
  ];

  environment.pathsToLink = [ "/share" ]; # Make applications discoverables by launchers.
}
