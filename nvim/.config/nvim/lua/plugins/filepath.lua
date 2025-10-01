return {
  "ohakutsu/socks-copypath.nvim",
  config = function()
    require("socks-copypath").setup()
  end,
  keys = {
    { "<leader>ccp", "<cmd>CopyPath<cr>", desc = "Copy path" },
    { "<leader>ccr", "<cmd>CopyRelativePath<cr>", desc = "Copy relative path" },
    { "<leader>ccn", "<cmd>CopyFileName<cr>", desc = "Copy file name" },
  },
}
