local config = require('session_manager.config')
require('session_manager').setup({
  autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
  autosave_last_session = false, -- Automatically save last session on exit and on session switch.
  autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
})
