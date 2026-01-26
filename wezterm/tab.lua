local tab = {}

function tab.setup(wezterm, config)
  config.hide_tab_bar_if_only_one_tab = true
  config.show_new_tab_button_in_tab_bar = false
  config.show_close_tab_button_in_tabs = false
end

return tab

