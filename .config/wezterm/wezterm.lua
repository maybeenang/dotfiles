local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- key bindings
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") }, -- paste from clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") }, -- paste from selected
	{ key = "r", mods = "CMD|SHIFT", action = act.ReloadConfiguration }, -- reload conf
}

-- color scheme
config.color_scheme = "Catppuccin Mocha"

-- cursor manager
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = "1.9px"
config.animation_fps = 24

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font Propo")
-- window decorations
-- config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 0,
	right = 8,
	top = 0,
	bottom = 0,
}

-- tab bar
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- config.tab_and_split_indices_are_zero_based = true
config.hide_tab_bar_if_only_one_tab = true
-- undercurl
-- run the command below on your terminal:
--
-- tempfile=$(mktemp) \
--   && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo \
--   && tic -x -o ~/.terminfo $tempfile \
--   && rm $tempfile
config.term = "wezterm"

config.window_background_opacity = 0.955555555

return config
