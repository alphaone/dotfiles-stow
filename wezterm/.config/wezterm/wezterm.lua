-- Pull in the wezterm API
local wezterm = require("wezterm")
local font = require("font")
local window = require("window")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

window.update_config(config)
font.update_config(config)

config.color_scheme = "Catppuccin Frappe"
config.max_fps = 120
config.animation_fps = 120

return config
