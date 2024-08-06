vim.keymap.set("n", "ff", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "QQ", ":q!<CR>", { silent = true })
vim.keymap.set("n", "WW", ":w!<CR>", { silent = true })

vim.keymap.set("n", "E", "$", { silent = true })
vim.keymap.set("n", "B", "^", { silent = true })

vim.keymap.set("n", "th", ":bprev<enter>", { silent = true })
vim.keymap.set("n", "tj", ":bfirst<enter>", { silent = true })
vim.keymap.set("n", "tk", ":blast<enter>", { silent = true })
vim.keymap.set("n", "tl", ":bnext<enter>", { silent = true })
vim.keymap.set("n", "td", ":bdelete<enter>", { silent = true })

vim.keymap.set("n", "<C-W>,", ":vertical resize -10<CR>", { silent = true })
vim.keymap.set("n", "<C-W>.", ":vertical resize +10<CR>", { silent = true })
