{
  pkgs,
  username,
  ...
}: {
  programs.firefox.enable = true;

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.firejail.enable = true;
}
