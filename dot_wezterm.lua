local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_background_opacity = 0.95
config.macos_window_background_blur = 20
config.font_size = 10
config.color_scheme = "Monokai Pro (Gogh)"
config.colors = {
	foreground = "#fcfcfa",
	background = "#2d2a2e",
}

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

return config
