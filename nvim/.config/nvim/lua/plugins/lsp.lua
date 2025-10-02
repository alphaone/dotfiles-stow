return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = { virtual_text = false },
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                -- nilness = true,
                -- unusedparams = true,
                -- unusedwrite = true,
                -- useany = true,
                ST1003 = false, -- https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/analyzers.md?autodive=0%2F%2F%2F%2F#poorly-chosen-identifier
                ST1000 = false, -- https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/analyzers.md?autodive=0%2F%2F%2F%2F#incorrect-or-missing-package-comment
              },
            },
          },
        },
      },
    },
  },
}
