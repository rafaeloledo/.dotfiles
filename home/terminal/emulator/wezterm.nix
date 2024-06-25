_: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        enable_tab_bar = false,
        enable_wayland = false,
        font_size = 14,
        color_scheme = "Solarized Dark - Patched",
        window_background_opacity = 0.9,
        enable_scroll_bar = false,
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,

        disable_default_key_bindings = true,
        keys = {
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ PasteFrom = "Clipboard" }),
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
          },
        },
        window_close_confirmation = "NeverPrompt",
        window_padding = {
          left = 3,
          right = 0,
          top = 1,
          bottom = 0,
        },
      }
    '';
  };
}
