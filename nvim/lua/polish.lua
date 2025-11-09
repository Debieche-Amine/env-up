-- to list themes :colorscheme <Tab>
vim.cmd("colorscheme astromars")

-- lines doesnt go off screen
vim.opt.wrap = true

-- spell checking
vim.opt.spell = true


-- Reselect visual selection after shifting left/right
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })



-- visual mode color (selected text color)
vim.api.nvim_set_hl(0, "Visual", { fg = "NONE", bg = "#44473a" })

-- Use system clipboard for all yank, delete, change, and paste operations
vim.opt.clipboard = "unnamedplus"

-- make register persist, command line history, and some more
vim.opt.shada = [[!,'100,<50,s100,h]]

-- move beetween buffers, leader k and leader j
vim.api.nvim_set_keymap('n', '<leader>j', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':bnext<CR>', { noremap = true, silent = true })


-- Map <leader>r to save file and execute register 'r' in a terminal split
vim.api.nvim_set_keymap('n', '<leader>r', [[:lua SaveAndRunRegisterR()<CR>]], { noremap = true, silent = true })

function SaveAndRunRegisterR()
  local cmd = vim.fn.getreg('r') -- get content of register 'r'
  if cmd == '' then
    print("Register 'r' is empty!")
    return
  end

  -- Save the current file
  vim.cmd('write')

  -- Open a horizontal terminal split and run the command
  vim.cmd('split | terminal ' .. cmd)
end



-- Load C/C++ config
require("me.c")

