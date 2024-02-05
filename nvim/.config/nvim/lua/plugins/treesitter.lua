return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = false,
        node_incremental = "v",
        -- node_decremental = "V",
        scope_incremental = false,
      },
    },
  },
}
