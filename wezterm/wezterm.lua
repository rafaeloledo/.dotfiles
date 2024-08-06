local wezterm = require 'wezterm'

return {
  enable_tab_bar = true,
  enable_wayland = false,
  font_size = 14,
  color_scheme = "Solarized Dark - Patched",
  window_background_opacity = 0.9,
  enable_scroll_bar = false,
  default_cursor_style = "SteadyBar",
  automatically_reload_config = true,

  window_close_confirmation = "NeverPrompt",

  window_padding = {
    left = 0,
    right = 0,
    top = 1,
    bottom = 0,
  },

  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.Nop,
    },
  },

}
