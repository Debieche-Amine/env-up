
-- Disable clangd formatting (keep completions, diagnostics, etc.) 
require('lspconfig').clangd.setup{
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
}


-- Set 4-space indentation for C/C++ files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
        vim.bo.tabstop = 4       -- how many spaces a <Tab> counts for
        vim.bo.shiftwidth = 4    -- how many spaces for autoindent
        vim.bo.softtabstop = 4   -- spacing for editing <Tab>
        vim.bo.expandtab = true  -- use spaces instead of real tabs
    end,
})
