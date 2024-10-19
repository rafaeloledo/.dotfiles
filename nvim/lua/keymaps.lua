-- open nvimtree with ff in normal mode
vim.keymap.set("n", "sf", ":Ex<CR>", { silent = true })

-- i don't know if i'm using this
vim.keymap.set("n", "QQ", ":q!<CR>", { silent = true })
vim.keymap.set("n", "WW", ":w!<CR>", { silent = true })
vim.keymap.set("n", "TT", ":TransparentToggle<CR>", {noremap=true})

-- while in normal mode and not in visual
vim.keymap.set("n", "E", "$", { silent = true })
vim.keymap.set("n", "B", "^", { silent = true })

-- show messages
vim.keymap.set('n', 'MM', ':messages<cr>')

-- cycle through background buffers
vim.keymap.set("n", "th", ":bprev<enter>", { silent = true })
vim.keymap.set("n", "tj", ":bfirst<enter>", { silent = true })
vim.keymap.set("n", "tk", ":blast<enter>", { silent = true })
vim.keymap.set("n", "tl", ":bnext<enter>", { silent = true })

-- shorthands for splitting
vim.keymap.set("n", "ss", "<C-w>s")
vim.keymap.set("n", "sv", "<C-w>v")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move between windows
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- delete current buffer
vim.keymap.set("n", "td", ":bdelete<enter>", { silent = true })

-- resize window view directly with , and . instead of shift + them
vim.keymap.set("n", "<C-w>,", ":vertical resize -10<CR>", { silent = true })
vim.keymap.set("n", "<C-w>.", ":vertical resize +10<CR>", { silent = true })

-- reload config doom emacs style
vim.keymap.set("n", "<leader>hrr", ":! home-manager switch --flake /mnt/share/.dotfiles/nix --impure 1>/dev/null 2>&1 <cr>", { silent = true })
