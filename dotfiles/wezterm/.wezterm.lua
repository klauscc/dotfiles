local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.font = wezterm.font("Hack Nerd Font Mono")
-- config.font = wezterm.font("Jetbrains Mono")
-- config.font = wezterm.font("Fira Code Medium")

config.font_size = 14
config.freetype_load_target="Normal"

config.color_scheme = "Catppuccin Mocha"
config.automatically_reload_config = true

config.keys = {
  { key = "LeftArrow", mods = "SUPER", action = act.ActivateTabRelative(-1) },
  { key = "RightArrow", mods = "SUPER", action = act.ActivateTabRelative(1) },
}

return config
