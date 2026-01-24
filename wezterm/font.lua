local font = {}

function font.setup(wezterm, config)
  wezterm.font("JetBrains Mono NL", {weight="Light"})
end

return font
