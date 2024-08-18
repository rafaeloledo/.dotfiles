local wezterm = require 'wezterm'

return {
  enable_tab_bar = false, -- toggle comment if want it
  enable_wayland = false,
  font_size = 14,
  font = wezterm.font('Roboto Mono'), -- i didn't have trouble in termux
  color_scheme = "Catppuccin Mocha",
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
