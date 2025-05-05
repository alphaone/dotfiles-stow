local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
	-- config.font = wezterm.font({ family = "Iosevka Extended", weight = "Medium" })
	-- config.font = wezterm.font("FiraCode Nerd Font")
	-- config.font = wezterm.font_with_fallback({
	-- 	{ family = "JetBrainsMono Nerd Font", weight = "Medium" },
	-- 	{ family = "JetBrains Mono", weight = "Medium" },
	-- })
	config.font_size = 16.0
end

return M
