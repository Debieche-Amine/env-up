{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    # Enable automatic completions from installed packages
    generateCompletions = true;

    shellAliases = {
      mv = "mv -i";
    };

    # Cursor styles

    interactiveShellInit = ''
      fish_vi_key_bindings
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      # Auto-start Zellij
      if status is-interactive; and not set -q ZELLIJ
          zellij
      end
    '';
  };
}
