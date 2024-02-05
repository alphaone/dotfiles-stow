return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Torsten's Notes/**.md",
    "BufNewFile "
      .. vim.fn.expand("~")
      .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Torsten's Notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Torsten's Notes",
      },
    },
    daily_notes = {
      folder = "Daily Notes",
      date_format = "%Y-%m-%d",
      template = "Daily Note Template.md",
    },
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    notes_subdir = "Zettelkasten",
    disable_frontmatter = true,
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        suffix = title
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- return tostring(os.time()) .. "-" .. suffix
      return suffix
    end,
    completion = {
      new_notes_location = "notes_subdir",
      use_path_only = false,
    },
  },
}
