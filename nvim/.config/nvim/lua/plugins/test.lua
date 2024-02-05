return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "yarn test --",
            -- jestConfigFile = "custom.jest.config.ts",
            -- env = { CI = true },
            -- cwd = function(path)
            --   return vim.fn.getcwd()
            -- end,
          }),
        },
      })
    end,
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run()
        end,
        desc = "Neotest run test under cursor",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest run file",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Neotest toggle output panel",
      },
      {
        "<leader>tw",
        function()
          require("neotest").output.open()
        end,
        desc = "Neotest open output window",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Neotest toggle summary",
      },
    },
  },
}
