-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- opt.mouse = ""
vim.o.relativenumber = false

vim.o.scrolloff = 5
vim.o.clipboard = "unnamedplus" -- use "unnamedplus" to enable system clipboard
vim.o.swapfile = false
vim.o.background = "light"
-- vim.o.winborder = "rounded"

vim.o.shada = "!,'1000,f1,<50,s10,h"

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
