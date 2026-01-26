local mouse = {}

function mouse.setup(wezterm, config)
  config.mouse_bindings = {
    -- 右クリックでクリップボードから貼り付け
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = wezterm.action.PasteFrom 'Clipboard',
    }
  }
end

return mouse

