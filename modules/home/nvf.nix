{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings = {
      vim = {
        options = {
          ignorecase = true;
          smartcase = true;
          wrap = true;
          foldmethod = "indent";
          foldlevel = 99;
          foldenable = true;

          cursorline = true;
        };
        theme = {
          enable = true;
          style = "warm"; #"dark", "darker", "cool", "deep", "warm", "warmer"
        };

        lineNumberMode = "relNumber";

        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          # hover.enable = true;
          # harper-ls.enable = true;
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
          # enableTreesitter = true;
          enableFormat = true;

          nix = {
            enable = true;
            # treesitter.enable = true;
            # treesitter.package = pkgs.vimPlugins.nvim-treesitter.grammarPlugins.nix;
          };
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
            # lsp.opts = ''
            #   ["rust-analyzer"] = {
            #     cargo = {
            #       allFeatures = true,
            #     },
            #     checkOnSave = true,
            #     procMacro = {
            #       enable = true,
            #     },
            #   }
            # '';
          };
          python.enable = true;
          bash.enable = true;
          markdown.enable = true;

          clang.enable = true;
        };

        diagnostics = {
          enable = true;
          config = {
            enable = true;
            virtual_text = true;
            # virtual_lines = true;
            underline = true;
            signs = true;
            update_in_insert = false;
          };
        };
        # visuals = {
        #   blink-indent.enable = true;
        # };
      };
    };
  };
}
