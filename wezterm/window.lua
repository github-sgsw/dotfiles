local window = {}

function window.setup(wezterm, config)
  config.window_background_opacity = 0.80
  inactive_pane_hsb = {
    hue = 0.9,
    saturation = 0.9,
    brightness = 1.0,
  }
end

return window
