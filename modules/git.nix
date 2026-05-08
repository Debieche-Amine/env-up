{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Amine";
      user.email = "amine_debieche@proton.me";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7cM18ycWHX4UkDI2rIAZMlhBp4WJ0tTMJVgNSUbrbD";
        signByDefault = true;
      };

      color.ui = true;
      push.default = "simple";
      init.defaultBranch = "main";
    };
  };
}
