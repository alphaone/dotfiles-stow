local wezterm = require("wezterm")
local mux = wezterm.mux

local M = {}

function M.update_config(config)
	config.window_background_opacity = 0.9
	config.macos_window_background_blur = 20

	-- config.initial_rows = 25
	-- config.initial_cols = 100

	config.scrollback_lines = 10000

	config.enable_tab_bar = false
	config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
	config.window_decorations = "RESIZE"

	wezterm.on("gui-startup", function()
		local _tab, _pane, win = mux.spawn_window({})
		win:gui_window():maximize()
	end)
end

return M
