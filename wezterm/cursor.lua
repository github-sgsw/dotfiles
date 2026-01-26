local cursor = {}

function cursor.setup(wezterm, config)
  config.cursor_blink_rate = 800
  config.default_cursor_style = 'BlinkingBlock'
end

return cursor
