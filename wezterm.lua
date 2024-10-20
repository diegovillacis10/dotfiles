local wezterm = require("wezterm")

local config = {}

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"

config.font = wezterm.font_with_fallback({
  "CaskaydiaCove Nerd Font",
  "Hack Nerd Font",
  "SauceCodePro Nerd Font",
  "FiraCode Nerd Font",
  "OpenDyslexic Nerd Font",
})

config.font_size = 13.0

config.hide_tab_bar_if_only_one_tab = true

config.window_background_image = os.getenv("HOME") .. "/Pictures/bg.png"
config.window_background_opacity = 1.0
config.window_background_image_hsb = {
  brightness = 0.04,
  hue = 1.0,
  saturation = 1.0,
}

return config
