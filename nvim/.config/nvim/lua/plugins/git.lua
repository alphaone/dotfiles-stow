return {
  {

    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 3000,
        ignore_whitespace = false,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    enable = false,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    opts = {
      sections = {
        recent = { folded = false },
      },
    },
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open({ kind = "auto" })
        end,
        desc = "NeoGit",
      },
    },
    config = true,
  },
}
