local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.font = wezterm.font("Hack Nerd Font Mono")
-- config.font = wezterm.font("Jetbrains Mono")
-- config.font = wezterm.font("Fira Code Medium")

config.font_size = 14
config.freetype_load_target = "Normal"

-- config.color_scheme = "rose-pine"
config.color_scheme = "catppuccin-mocha"
config.automatically_reload_config = true

config.audible_bell = "Disabled"

config.keys = {
	{ key = "LeftArrow", mods = "SUPER", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SUPER", action = act.ActivateTabRelative(1) },
	{
		key = "'",
		mods = "SUPER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "5",
		mods = "SUPER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},

	-- move tab
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
}

return config
