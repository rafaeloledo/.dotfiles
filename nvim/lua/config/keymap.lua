local opts = { silent = true }
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ct", ":LspStop<CR>", { desc = "LspStop" })
vim.keymap.set("n", "<C-q>", "<C-z>")
vim.keymap.set("n", "<leader>yc", "ggVGy<C-o>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set({ "n", "v" }, "<leader>td", '"_d')
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
