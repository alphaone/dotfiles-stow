return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.files",
    opts = {
      windows = { preview = false },
      mappings = { go_in_plus = "<CR>" },
      options = { use_as_default_explorer = true },
    },
    keys = {
      {
        "<leader>e",
        function()
          local buf = vim.api.nvim_buf_get_name(0)
          if vim.loop.fs_stat(buf) then
            require("mini.files").open(buf, true)
          else
            require("mini.files").open(vim.loop.cwd(), true)
          end
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
