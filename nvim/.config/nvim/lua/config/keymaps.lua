-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

-- handy for escaping arrays, objects and strings
map("i", ";;", "<C-o>A;")
map("i", ",,", "<C-o>A,")

map("n", "U", "<C-r>")
-- so the cursor does not jump back to where you started the selection
map("v", "y", "ygv<esc>")

-- macros
map("n", "Q", "@@j")
map("x", "Q", ":norm @@<CR>")

-- this is needed, to replace lazy vim's default (that is somehow only messing things up if you start nvim with a starter)
vim.keymap.set("n", "<C-j>", ":<C-U>TmuxNavigateDown<CR>", { desc = "Goto lower window (TMUX aware)", silent = true })
vim.keymap.set("n", "<C-k>", ":<C-U>TmuxNavigateUp<CR>", { desc = "Goto upper window (TMUX aware)", silent = true })
vim.keymap.set("n", "<C-h>", ":<C-U>TmuxNavigateLeft<CR>", { desc = "Goto left window (TMUX aware)", silent = true })
vim.keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateRight<CR>", { desc = "Goto right window (TMUX aware)", silent = true })
