require('bufferline').setup{
	options = {
		-- open buffer in the current tab
		mode = "tabs",
		always_show_bufferline = false,
	},
}

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "q", ":bd<CR>", { silent = true })
