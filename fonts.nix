{ pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      font-awesome
      noto-fonts
      cantarell-fonts
      powerline-fonts
      roboto
      roboto-slab
      emojione
    ];

    fontconfig = {
      enable = true;
      penultimate.enable = true;
      defaultFonts = {
        emoji = ["EmojiOne Color"];
        monospace = ["Source Code Pro for Powerline" "Roboto Mono for Powerline"];
        sansSerif = ["Roboto"];
        serif = ["Roboto Slab"];
      };
    };
  };
}
