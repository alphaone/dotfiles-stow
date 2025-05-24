vim.cmd([[
  let g:test#strategy = "vimux"
  let g:test#javascript#vitest#executable = "yarn test --no-coverage"
]])

return {
  "vim-test/vim-test",
  dependencies = { "preservim/vimux" },
  keys = {
    { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>tT", "<cmd>TestFile<cr>", desc = "Run all tests in file" },
    { "<leader>tl", "<cmd>TestLast<cr>", desc = "Run last test" },
  },
}
