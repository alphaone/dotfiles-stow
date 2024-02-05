return {
  -- { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      filetypes = {
        markdown = true,
      },
    },
  },
}
