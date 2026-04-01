{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings = {
      vim = {
        lineNumberMode = "relNumber";

        autocomplete.nvim-cmp.enable = true;
        theme.enable = true;
        statusline.lualine.enable = true;
        telescope.enable = true;

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          # hover.enable = true;
          harper-ls.enable = true;
          inlayHints.enable = true;
          lightbulb = {
            enable = true;
            autocmd.enable = true;
          };
          lspSignature.enable = true;
          # lspsaga.enable = true; # not seeing any deffirence
          # null-ls.enable = true; # idk what it do
        };

        languages = {
          enableDAP = true;
          enableTreesitter = true;
          enableFormat = true;

          nix = {
            enable = true;
            treesitter.enable = false;
          };
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
            format.enable = true;
          };
          python.enable = true;
          bash.enable = true;
          clang.enable = true;
        };
        # diagnostics.config.virtual_text = true;
        diagnostics = {
          # enable = true;
          config = {
            enable = true;
            virtual_text = true;
            underline = true;
            signs = true;
            updateInInsert = false;
          };
        };
      };
    };
  };
}
