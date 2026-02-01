local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- 画面フルスクリーン切り替え。背景透過が連動しないからいらないかも、
    { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },

    -- Pane操作
    { key = 'm', mods = 'ALT', action = act.ActivatePaneDirection('Left') },
    { key = 'v', mods = 'ALT', action = act.ActivatePaneDirection('Right') },
    { key = 't', mods = 'ALT', action = act.ActivatePaneDirection('Up') },
    { key = 'w', mods = 'ALT', action = act.ActivatePaneDirection('Down') },

    -- ペインの水平分割
    { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    -- ペインの上下分割
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- タブ移動
    { key = 'RightArrow', mods = 'ALT', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'ALT', action = act.ActivateTabRelative(-1) },

    -- コマンドパレット表示
    { key = 'p', mods = 'LEADER', action = act.ActivateCommandPalette }
  }
}
