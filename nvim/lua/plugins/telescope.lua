require('telescope').load_extension('git_worktree')

local telescope = require('telescope')

telescope.setup {
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.65,     
			horizontal = {
				width = 0.99,
				height = 0.99,
				size = {
					width = "100%",
					height = "100%",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
			}
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
				["<C-d>"] = require('telescope.actions').move_selection_previous,
			},
			n = {
				['<C-f>'] = require('telescope.actions').preview_scrolling_left,
				['<C-k>'] = require('telescope.actions').preview_scrolling_right,
			}
		},
	},
}

local set = vim.keymap.set
local builtin = require('telescope.builtin')

set('n', '<leader>sf', builtin.find_files)
set('n', '<leader>sb', builtin.buffers)
set('n', '<leader>sd', builtin.diagnostics)
set('n', '<leader>sw', builtin.grep_string)
set('n', '<leader>sg', builtin.live_grep)
set('n', '<leader>sS', builtin.git_status)
