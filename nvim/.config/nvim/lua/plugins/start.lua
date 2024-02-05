return {
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("alpha").setup(require("alpha.themes.startify").config)
  --   end,
  -- },
  {
    "echasnovski/mini.starter",
    opts = function()
      local logo = table.concat({
        "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
        "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
        "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
        "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
        "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
        "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
      }, "\n")
      local new_section = function(name, action, section)
        return { name = name, action = action, section = section }
      end

      local starter = require("mini.starter")
     
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          starter.sections.recent_files(10, true),
          -- starter.sections.recent_files(10, false),

          new_section("Extras",          "LazyExtras",                          "Config"),
          new_section("Lazy",            "Lazy",                                "Config"),
          new_section("New file",        "ene | startinsert",                   "Built-in"),
          new_section("Quit",            "qa",                                  "Built-in"),

        },
        content_hooks = {
          starter.gen_hook.adding_bullet("░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },
}
