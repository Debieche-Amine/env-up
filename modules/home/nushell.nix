{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        edit_mode: vi
      }
    '';
  };
}
