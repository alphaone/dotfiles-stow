-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- opt.mouse = ""
opt.relativenumber = false
opt.scrolloff = 5
opt.clipboard = "unnamedplus" -- use "unnamedplus" to enable system clipboard
opt.swapfile = false

opt.shada = "!,'1000,f1,<50,s10,h"
