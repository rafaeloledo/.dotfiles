-- i don't know if i'm using this
vim.keymap.set("n", "QQ", ":qa<CR>", { silent = true })
vim.keymap.set("n", "WW", ":w!<CR>", { silent = true })
vim.keymap.set("n", "TT", ":TransparentToggle<CR>", {noremap=true})

-- while in normal mode and not in visual
vim.keymap.set("n", "H", "^", { silent = true })
vim.keymap.set("n", "L", "$", { silent = true })

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

-- Select all, also yanks and back to the cursor original position
-- the reason is that i only use this shortcut to yank all, so, may i copy it straight?
vim.keymap.set("n", "<C-a>", "gg<S-v>Gy<Esc><C-o><C-o>", { silent = true })
vim.keymap.set("n", "<C-S-a>", "gg<S-v>Gd<Esc><C-o><C-o>", { silent = true })

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
vim.keymap.set("n", "<leader>hrr", ":silent !home-manager switch --flake /mnt/share/.dotfiles/nix --impure 1>/dev/null 2>&1 <cr>", { silent = true })

vim.keymap.set("n", ";s", ":SessionManager load_session<CR>", { silent = true })
vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", function ()
	vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
end)

vim.keymap.set("n", "<leader>o", ":silent !C:\\dev\\scoop\\apps\\wezterm\\current\\wezterm-gui.exe start --cwd .<CR>", { silent = true })
vim.keymap.set("n", "<CR>",":noh<CR>", { silent = true })
vim.keymap.set("n", "<C-;>", ";")
vim.keymap.set("n", "te", ":tabedit<CR>", { silent = true })
