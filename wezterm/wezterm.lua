-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

require("window").setup(wezterm, config)
require("mouse").setup(wezterm, config)
require("font").setup(wezterm, config)
require("tab").setup(wezterm, config)
require("cursor").setup(wezterm, config)
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'Nord (Gogh)'

-- Finally, return the configuration to wezterm:
return config
