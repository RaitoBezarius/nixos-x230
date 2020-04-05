{ pkgs, ... }:
{
  fonts ={
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      powerline-fonts
      roboto
      roboto-slab
      emojione
    ];

    fontconfig = {
      penultimate.enable = true;
      defaultFonts = {
        monospace = ["Source Code Pro for Powerline" "Roboto Mono for Powerline"];
        sansSerif = ["Roboto"];
        serif = ["Roboto Slab"];
      };
    };
  };
}
