local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  -- plugins list -- 
  "xiyaowong/transparent.nvim",
  "Shatur/neovim-session-manager",
  "nvim-lua/plenary.nvim",
  "sindrets/diffview.nvim",
  "hrsh7th/nvim-cmp",
	"akinsho/bufferline.nvim",
  "NeogitOrg/neogit",
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "tpope/vim-surround",
	"nvim-telescope/telescope-file-browser.nvim",

  "nvim-telescope/telescope-symbols.nvim",
  { "nvim-telescope/telescope.nvim", branch = "master" }, -- to acess preview scrolling left and right
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  { "catppuccin/nvim", name = "catppuccin" },
	{ "craftzdog/solarized-osaka.nvim", lazy = false },

  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  {
    "epwalsh/obsidian.nvim",
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "C:\\dev\\anotacoes",
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
		enabled = false,
    config = function()
      require("nvim-tree").setup()
    end,
  },

  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function ()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
      }
    end
  },

  {
    "mistricky/codesnap.nvim",
    enabled = false,
    pin = true,
    tag = "v0.0.11",
    build = "make",
  },

  'ThePrimeagen/git-worktree.nvim',

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "folke/twilight.nvim",
    ft = "markdown",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  "lewis6991/gitsigns.nvim",

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup({
        view = {
          entries = "native"
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "neorg" },
        },
      })
    end
  },

})
