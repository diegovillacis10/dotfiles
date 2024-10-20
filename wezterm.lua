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

-- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#wezterm
wezterm.on("user-var-changed", function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
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
