# Agent Guidelines for LazyVim Configuration

This is a LazyVim-based Neovim configuration written in Lua. This document provides guidelines for AI coding agents working in this repository.

## Project Overview

- **Framework**: LazyVim (a Neovim distribution)
- **Plugin Manager**: lazy.nvim
- **Language**: Lua
- **Structure**: Modular plugin-based configuration with `lua/config/` for core settings and `lua/plugins/` for plugin specifications

## Testing Commands

This configuration uses vim-test with vimux strategy for running tests.

### Running Tests

```vim
:TestNearest    " Run the test nearest to cursor (<leader>tt)
:TestFile       " Run all tests in current file (<leader>tT)
:TestLast       " Rerun the last test (<leader>tl)
```

### Test Configuration

- **Strategy**: vimux (runs tests in tmux pane)
- **JavaScript/TypeScript**: Uses Vitest via `yarn test --no-coverage`
- **Configuration**: See `lua/plugins/test.lua`

## Formatting & Linting

### Stylua (Lua Formatter)

```bash
stylua .                    # Format all Lua files
stylua lua/plugins/         # Format specific directory
stylua path/to/file.lua     # Format single file
```

**Configuration** (`stylua.toml`):
- **Indentation**: 2 spaces
- **Line width**: 120 characters
- **Type**: Spaces (not tabs)

### Other Formatters

LazyVim includes formatters via extras:
- **Prettier**: JavaScript, TypeScript, JSON, Markdown, YAML
- **ESLint**: JavaScript/TypeScript linting
- **Go**: gofmt, goimports (via gopls)
- **Python**: black, isort (via extras)

Format current buffer: `<leader>cf` or `:LazyFormat`

## Code Style Guidelines

### File Organization

```
init.lua                 # Entry point, bootstraps lazy.nvim
lua/
  config/
    lazy.lua            # lazy.nvim setup and plugin spec imports
    options.lua         # Vim options (loaded before plugins)
    keymaps.lua         # Global keymaps (loaded on VeryLazy)
    autocmds.lua        # Autocommands (loaded on VeryLazy)
  plugins/
    *.lua               # Individual plugin specifications
```

### Plugin File Structure

Each plugin file in `lua/plugins/` should return a table (or array of tables):

```lua
return {
  "author/plugin-name",
  dependencies = { "required/plugin" },
  opts = {
    -- Plugin options passed to setup()
  },
  keys = {
    { "<leader>xx", "<cmd>Command<cr>", desc = "Description" },
  },
  config = function()
    -- Custom setup logic (if opts isn't sufficient)
  end,
}
```

### Imports

Use `require()` for loading modules:

```lua
-- Good
local plugin = require("plugin-name")
plugin.setup()

-- Good - direct call
require("plugin-name").setup()

-- Good - lazy loading in functions
keys = {
  {
    "<leader>xx",
    function()
      require("plugin-name").action()
    end,
    desc = "Do action",
  },
}
```

### Naming Conventions

- **Files**: `snake_case.lua` (e.g., `file-explorer.lua`, `test.lua`)
- **Variables**: `camelCase` or `snake_case` (follow Lua conventions)
  ```lua
  local myVariable = "value"
  local my_variable = "value"  -- Both acceptable
  ```
- **Constants**: `UPPER_SNAKE_CASE`
  ```lua
  local MAX_RETRIES = 3
  ```
- **Functions**: `snake_case` or `camelCase`
  ```lua
  local function setup_plugin()
    -- implementation
  end
  ```

### Formatting Rules

- **Indentation**: 2 spaces (enforced by stylua)
- **Line width**: 120 characters maximum
- **No tabs**: Use spaces only
- **Trailing commas**: Stylua will handle consistency
- **String quotes**: Prefer double quotes (stylua default)

### Keymaps

Always include descriptive `desc` field for which-key:

```lua
-- Good
keys = {
  { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
  { "<leader>e", function() require("mini.files").open() end, desc = "Open file explorer" },
}

-- Bad - missing desc
keys = {
  { "<leader>tt", "<cmd>TestNearest<cr>" },
}
```

**Conventions**:
- Use `<leader>` for custom mappings (leader is space by default in LazyVim)
- Group related commands under same prefix (e.g., `<leader>t` for tests, `<leader>C` for coverage)
- Register groups in `lua/plugins/whichkey.lua`:
  ```lua
  spec = {
    { "<leader>t", group = "test" },
  }
  ```

### Comments

```lua
-- Single line comments for brief explanations

-- Use comments to explain WHY, not WHAT
-- Good: Disable nilness check as it's too aggressive for our codebase
ST1003 = false,

-- Bad: Set to false
ST1003 = false,

-- Multi-line explanation
-- for complex configurations
-- that need more context
```

### Error Handling

Use `pcall` for operations that might fail:

```lua
-- Good
local ok, result = pcall(require, "optional-module")
if ok then
  result.setup()
end

-- Good - with error handling
local ok, err = pcall(function()
  require("module").risky_operation()
end)
if not ok then
  vim.notify("Operation failed: " .. err, vim.log.levels.ERROR)
end
```

### Types and Annotations

Use LuaCATS annotations for better IDE support (optional but helpful):

```lua
---@param opts table Configuration options
---@return boolean success Whether setup succeeded
local function setup(opts)
  -- implementation
end
```

## Common Patterns

### Disabling Default Plugins

```lua
return {
  "plugin/to-disable",
  enabled = false,
}
```

### Extending Default Configs

LazyVim provides defaults for many plugins. Extend them with `opts`:

```lua
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>t", group = "test" },  -- Adds to existing spec
    },
  },
}
```

### Lazy Loading

```lua
return {
  "plugin/name",
  cmd = "PluginCommand",        -- Load on command
  keys = { "<leader>xx" },      -- Load on keymap
  event = "VeryLazy",           -- Load after startup
  ft = "lua",                   -- Load for filetype
}
```

### Conditional Configuration

```lua
return {
  "plugin/name",
  cond = function()
    return vim.fn.executable("binary") == 1
  end,
}
```

## Development Workflow

### Managing Plugins

```vim
:Lazy                 " Open lazy.nvim UI
:Lazy sync            " Install/update/clean plugins
:Lazy clean           " Remove unused plugins
:Lazy profile         " Profile plugin load times
:LazyExtras           " Browse and install LazyVim extras
```

### Diagnostics

```vim
:checkhealth          " Check Neovim health (LSP, plugins, etc.)
:checkhealth lazy     " Check lazy.nvim specifically
```

### Reloading Configuration

After editing configs:
1. Save the file (format will run on save)
2. Restart Neovim or use `:Lazy reload <plugin>`
3. For option changes, restart Neovim

### Testing Changes

1. Make changes to plugin config
2. Run `:Lazy reload <plugin-name>` if plugin supports reload
3. Test the functionality
4. Check for errors with `:messages`
5. Verify with `:checkhealth` if issues persist

## Important Notes

- **LazyVim Extras**: This config uses many LazyVim extras (see `lazyvim.json`). These provide pre-configured language support and features.
- **Options Override**: Settings in `lua/config/options.lua` override LazyVim defaults
- **Keymap Priority**: Custom keymaps in `lua/config/keymaps.lua` check for lazy.nvim handlers to avoid conflicts
- **Virtual Text**: Diagnostics virtual text is disabled (configured in `lua/config/options.lua` and `lua/plugins/lsp.lua`)
- **Relative Numbers**: Disabled in favor of absolute line numbers

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)
