{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Amine";
      user.email = "";
      color.ui = true;
      push.default = "simple";
      init.defaultBranch = "main";
    };
  };
}
