vim.cmd("colorscheme catppuccin")
vim.cmd("set clipboard+=unnamed,unnamedplus")
vim.o.hlsearch = true
vim.wo.number = true
vim.o.relativenumber = true
vim.o.undofile = true
vim.o.ignorecase = true

vim.o.conceallevel = 2
vim.o.completeopt = 'menuone,noselect'
vim.wo.signcolumn = 'number'
vim.o.updatetime = 250

vim.opt.swapfile = false

vim.cmd('set shada="NONE"')
vim.opt.fillchars = { eob = " " }

vim.cmd('set fileformats=unix,dos')

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })

vim.cmd("set nolist")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
