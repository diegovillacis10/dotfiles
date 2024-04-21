local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14.0

config.hide_tab_bar_if_only_one_tab = true

config.window_background_image = "/Users/diego.villacis/Pictures/bg.png"
config.window_background_image_hsb = {
  brightness = 0.05,
  hue = 1.0,
  saturation = 1.0,
}

return config
