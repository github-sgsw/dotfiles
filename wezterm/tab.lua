local tab = {}

function tab.setup(wezterm, config)
  config.hide_tab_bar_if_only_one_tab = true
  config.show_new_tab_button_in_tab_bar = false
end

return tab

