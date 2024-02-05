return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
      pickers = {
        live_grep = {
          -- include hidden files is live_grep search
          additional_args = function(opts)
            return { "--hidden" }
          end,
        },
      },
    },
  },
}
