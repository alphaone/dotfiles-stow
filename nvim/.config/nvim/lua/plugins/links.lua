return {
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    submodules = false, -- not needed, submodules are required only for tests

    opts = {
      open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
        go = true, -- open pkg.go.dev from an import statement (uses treesitter)
      },
      handler_options = {
        search_engine = "duckduckgo", -- you can select between google, bing, duckduckgo, ecosia and yandex
        select_for_search = false, -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link
      },
    },
  },
}
