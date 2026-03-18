{
  config,
  pkgs,
  ...
}: {
  home.file = {
    # This maps the local ./config directory to ~/.config/something
    ".config/cosmic" = {
      source = ./config;
      recursive = true;
    };
  };
}
