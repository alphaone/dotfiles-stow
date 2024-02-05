return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("typescript", { "javascript" })
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })
    end,
  },
}
