-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.font_size = 14.0

-- config.window_background_image = '/home/milos/.config/wezterm/bg.jpg'
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.initial_cols = 160
config.initial_rows = 48

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font "JetBrains Mono"
config.harfbuzz_features = { 'calt=0' } -- disable ligatures

config.hide_tab_bar_if_only_one_tab = true

local act = wezterm.action
config.keys = {
	{-- split pane
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" })
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" })
	},
	{-- close current pane
		key = "w",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = true })
	},
	-- {-- rotate panes
	-- 	key = "b",
	-- 	mods = "CTRL",
	-- 	action = act.RotatePanes("CounterClockwise")
	-- },
	-- {
	-- 	key = "n",
	-- 	mods = "CTRL",
	-- 	action = act.RotatePanes("Clockwise")
	-- },
	{-- switch panes
		key = "LeftArrow",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left")
	},
	{
		key = "RightArrow",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right")
	},
	{
		key = "UpArrow",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up")
	},
	{
		key = "DownArrow",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down")
	},
	{-- switch tabs
		key = "[",
		mods = "ALT",
		action = act.ActivateTabRelative(-1)
	},
	{
		key = "]",
		mods = "ALT",
		action = act.ActivateTabRelative(1)
	}
}

-- and finally, return the configuration to wezterm
return config