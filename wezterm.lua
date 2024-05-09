local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"

-- TODO: use fallback
config.font = wezterm.font("CaskaydiaCove Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")
-- config.font = wezterm.font("SauceCodePro Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("OpenDyslexic Nerd Font")
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
-- config.font = wezterm.font("SauceCodePro Nerd Font")

config.font_size = 13.0

config.hide_tab_bar_if_only_one_tab = true

config.window_background_image = os.getenv("HOME") .. "/Pictures/bg.png"
config.window_background_image_hsb = {
  brightness = 0.04,
  hue = 1.0,
  saturation = 1.0,
}

return config
