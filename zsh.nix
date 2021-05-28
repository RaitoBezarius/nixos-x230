{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh-command-time
    zsh-history-substring-search # i lived with fish for too long.
    zsh-you-should-use
  ];

  programs.zsh = {
    enable = true;
    enableGlobalCompInit = false;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    interactiveShellInit = ''
      bindkey '^F' autosuggest-accept
      source ${pkgs.zsh-command-time}/share/zsh/plugins/command-time/command-time.plugin.zsh
      source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    '';
  };
}
