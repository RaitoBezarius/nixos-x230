{ pkgs, ... }:
{
  environment.variables = { EDITOR = "nvim"; };

  environment.systemPackages = with pkgs; [
    pkgs.nodejs
    pkgs.rust-analyzer
    (neovim.override {
      viAlias = true;
      vimAlias = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [ vim-lastplace vim-nix vim-yaml coc-nvim coc-rust-analyzer rust-vim zig-vim ctrlp ]; 
          opt = [];
        };
        customRC = ''
          " your custom vimrc
          set nocompatible
          set backspace=indent,eol,start
          " ...
        '';
      };
    }
  )];
}
