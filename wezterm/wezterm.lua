local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2},
	})

	window:gui_window():set_inner_size(width, height)
end)

return {
	colors = {
		background = 'hsla(192, 100%, 5%, 1)',
		cursor_bg = 'hsla(194, 14%, 40%, 1)'
	},
  enable_tab_bar = false, -- toggle comment if want it
  enable_wayland = false,
  font_size = 14,
  font = wezterm.font('Roboto Mono'), -- i didn't have trouble in termux
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
