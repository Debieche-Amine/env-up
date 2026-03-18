{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];

    initLua = ''
      vim.o.clipboard = "unnamedplus"

      vim.o.number = true
      vim.o.relativenumber = true
    '';
    # vim.lsp.config.nixd.setup({})
  };
}
