local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return {
  -- enable_tab_bar = false, -- toggle comment if want it
  enable_wayland = false,
  font_size = 14,
  font = wezterm.font('Roboto Mono'), -- i didn't have trouble in termux
  color_scheme = "Catppuccin Mocha",
  window_background_opacity = 0.9,
  enable_scroll_bar = false,
  initial_cols = 119,
  initial_rows = 36,
  default_cursor_style = "SteadyBar",
  default_prog = { "C:\\dev\\scoop\\apps\\pwsh\\current\\pwsh.exe", "-nologo" },
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
