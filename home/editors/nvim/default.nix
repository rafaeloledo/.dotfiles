{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovim
    neovide
  ];

  home.file.".config/nvim/init.lua" = {
    recursive = true;
    enable = true;
    text = ''
      -- bootstrap lazy.nvim, LazyVim and your plugins
      require("config.lazy")

      vim.g.netrw_browse_split = 0
      vim.g.netrw_banner = 0
      vim.g.netrw_winsize = 25

      vim.g.copilot_enabled = 0
    '';
  };

  home.file.".config/nvim/lua/config/options.lua" = {
    recursive = true;
    enable = true;
    text = ''
      local opt = vim.opt
      local wo = vim.wo

      vim.g.mapleader = " "

      vim.cmd("language en_US.utf8")
      vim.scriptencoding = "utf-8"
      opt.encoding = "utf-8"
      opt.fileencoding = "utf-8"

      opt.guicursor = "i:block"

      wo.number = false
      opt.relativenumber = false
      opt.title = true
      opt.autoindent = true
      opt.wrap = false
      opt.smartindent = true
      opt.hlsearch = true
      opt.backup = false
      opt.showcmd = true
      opt.laststatus = 2
      opt.expandtab = true
      opt.scrolloff = 10
      opt.inccommand = "split"
      opt.ignorecase = true
      opt.smarttab = true
      opt.breakindent = true
      opt.shiftwidth = 2
      opt.tabstop = 2
      opt.cursorline = true
      opt.termguicolors = true
      opt.winblend = 0
      opt.wildoptions = "pum"
      opt.pumblend = 5
      opt.background = "dark"
      opt.incsearch = true
      opt.swapfile = false
      wo.signcolumn = "number"
      opt.statuscolumn = ""

      opt.cmdheight = 1
      opt.undofile = true
      vim.o.showmode = true

      -- opt.colorcolumn = "80"
      -- opt.shell = 'fish'

      vim.cmd("set fileformats=unix,dos")

      opt.clipboard:prepend({ "unnamed", "unnamedplus" }) -- Merge clipboards

      -- Undercurl
      vim.cmd([[let &t_Ce = "\e[4:0m"]])
      vim.cmd([[let &t_Cs = "\e[4:3m"]])

      opt.backupskip = { "/tmp/*", "/private/tmp/*" }
      opt.backspace = { "start", "eol", "indent" }
      opt.path:append({ "**" })
      opt.wildignore:append({ "*/node_modules/*" })
      opt.formatoptions:append({ "r" })

      vim.cmd('set shada="NONE"')

      opt.fillchars = { eob = " " }

      vim.cmd("set nolist")

      if vim.g.neovide then
        print(vim.g.neovide_version)
      end

      vim.opt.mouse = ""

      -- Neovide (Mainly for Windows)
      vim.o.guifont = "Hack Nerd Font:14"
      vim.opt.linespace = 0
      vim.g.neovide_scale_factor = 1.0
      vim.g.neovide_text_gamma = 0.0
      vim.g.neovide_text_contrast = 0.5
      vim.g.neovide_padding_top = 0
      vim.g.neovide_padding_bottom = 0
      vim.g.neovide_padding_right = 0
      vim.g.neovide_padding_left = 0

      -- Helper function for transparency formatting
      local alpha = function()
        return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
      end
      vim.g.neovide_transparency = 0.8
      vim.g.transparency = 0.8
      vim.g.neovide_background_color = "#00141A" .. alpha()
      vim.g.neovide_floating_blur_amount_x = 2.0
      vim.g.neovide_floating_blur_amount_y = 2.0
      vim.g.neovide_show_border = false --macos
      vim.g.neovide_position_animation_length = 0
      vim.g.neovide_scroll_animation_length = 0
      vim.g.neovide_scroll_animation_far_lines = 0
      vim.g.neovide_hide_mouse_when_typing = true
      vim.g.neovide_underline_stroke_scale = 1.0
      vim.g.neovide_theme = "auto"
      vim.g.experimental_layer_grouping = true
      vim.g.neovide_refresh_rate = 144
      vim.g.neovide_refresh_rate_idle = 5
      vim.g.neovide_fullscreen = true
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_size = 0
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_cursor_animate_in_insert_mode = false
      vim.g.neovide_cursor_animate_command_line = false
      vim.g.neovide_cursor_unfocused_outline_width = 0.125
      vim.g.neovide_profiler = false
      --- end
    '';
  };

  home.file.".config/nvim/lua/config/lazy.lua" = {
    recursive = true;
    enable = true;
    text = ''
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        -- bootstrap lazy.nvim
        -- stylua: ignore
        vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
      end
      vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

      require("lazy").setup({
        spec = {
          -- add LazyVim and import its plugins
          {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = {
              colorscheme = "solarized-osaka",
              news = {
                lazyvim = false,
                neovim = false,
              },
            },
          },
          -- import any extras modules here
          { import = "lazyvim.plugins.extras.lang.typescript" },
          { import = "lazyvim.plugins.extras.lang.json" },
          { import = "lazyvim.plugins.extras.linting.eslint" },
          { import = "lazyvim.plugins.extras.formatting.prettier" },
          { import = "lazyvim.plugins.extras.lang.rust" },
          { import = "lazyvim.plugins.extras.lang.tailwind" },
          { import = "lazyvim.plugins.extras.coding.copilot" },
          { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
          -- import/override with your plugins
          { import = "plugins" },
        },
        defaults = {
          -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
          -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
          lazy = false,
          -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
          -- have outdated releases, which may break your Neovim install.
          version = false, -- always use the latest git commit
          -- version = "*", -- try installing the latest stable version for plugins that support semver
        },
        install = { colorscheme = { "tokyonight", "habamax" } },
        checker = { enabled = false }, -- automatically check for plugin updates
        performance = {
          rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
              "gzip",
              -- "matchit",
              -- "matchparen",
              "rplugin",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
        change_detection = { notify = false },
      })
    '';
  };

  home.file.".config/nvim/lua/config/keymaps.lua" = {
    recursive = true;
    enable = true;
    text = ''
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }

      set("n", "x", '"_x') -- Delete permanently

      set("n", "+", "<C-a>") -- Increment
      set("n", "-", "<C-x>") -- Decrement

      set("n", "dw", 'vB"_d') -- Delete word backwards
      set("i", "<C-z>", "<Esc>ua")
      set("n", "<C-a>", "gg<S-v>G") -- Select all

      set({ "n", "i" }, "<C-s>", "<Esc>:w<return>", { silent = true })

      set("n", "te", ":tabedit<return>", { silent = true }) -- Tab Edit

      -- Split window
      set("n", "ss", ":split<return>", opts)
      set("n", "sv", ":vsplit<return>", opts)
      -- Move window
      set("n", "sh", "<C-w>h")
      set("n", "sk", "<C-w>k")
      set("n", "sj", "<C-w>j")
      set("n", "sl", "<C-w>l")

      -- Resize window
      set("n", "<C-w><left>", "<C-w><")
      set("n", "<C-w><right>", "<C-w>>")
      set("n", "<C-w><up>", "<C-w>+")
      set("n", "<C-w><down>", "<C-w>-")

      set("n", "<CR>", ":noh<cr>")

      set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
      set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

      set("n", "<C-d>", "<C-d>zz")
      set("n", "<C-u>", "<C-u>zz")
      set("n", "n", "nzzzv")
      set("n", "N", "Nzzzv")

      set("n", "Q", "<nop>")

      set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { desc = "Go to definition" })

      set("n", "gl", function()
        vim.lsp.diagnostic.get_line_diagnostics()
      end, { desc = "Get line diagnostics" })

      set("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "Hover docs" })

      set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "Code actions" })

      set("n", "gr", function()
        vim.lsp.buf.rename()
      end, { desc = "Rename" })

      set("n", "gD", function()
        vim.lsp.buf.declaration()
      end, { desc = "Declaration" })

      set("n", "gI", function()
        vim.lsp.buf.implementation()
      end, { desc = "Implmentation" })

      set("n", "sp", function()
        print(vim.fn.expand("%:p"))
      end, { desc = "Show path" })

      set("n", "<leader>km", ":Telescope keymaps<cr>", { desc = "keymaps" })
      set("n", "<leader>gb", ":GitBlame<cr>", { desc = "Git blame" })

      set("n", "<leader>tl", function()
        local clients = vim.lsp.get_clients()

        if not clients or vim.tbl_isempty(clients) then
          vim.cmd("LspStart")
          vim.cmd("Copilot attach")
        else
          vim.cmd("LspStop")
        end
      end, { desc = "Toggle LSPs" })

      set("n", "<leader>sw", ":set wrap")

      set("n", "<leader>tc", function()
        if vim.g.copilot_enabled then
          vim.cmd("Copilot disable")
          vim.g.copilot_enabled = false
        else
          vim.cmd("Copilot enable")
          vim.cmd("Copilot attach")
          vim.g.copilot_enabled = true
        end
        vim.cmd("Copilot status")
      end, { desc = "Toggle Copilot" })
    '';
  };

  home.file.".config/nvim/lua/config/autocmds.lua" = {
    recursive = true;
    enable = true;
    text = ''
      -- Autocmds are automatically loaded on the VeryLazy event
      -- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
      -- Add any additional autocmds here
      -- Turn off paste mode when leaving insert
      --
      local api = vim.api

      api.nvim_create_autocmd("InsertLeave", {
        pattern = "*",
        command = "set nopaste",
      })

      -- Disable the concealing in some file formats
      -- The default conceallevel is 3 in LazyVim
      api.nvim_create_autocmd("FileType", {
        pattern = { "json", "jsonc", "markdown" },
        callback = function()
          vim.opt.conceallevel = 0
        end,
      })

      api.nvim_create_autocmd("InsertLeave", {
        pattern = "*",
        command = "set nopaste",
      })
      api.nvim_create_autocmd("BufWritePost", {
        command = ":silent! %s/\r/",
      })
      api.nvim_create_autocmd("FileType", {
        pattern = "inc",
        command = ":set ft=asm",
      })
      api.nvim_create_autocmd("FileType", {
        pattern = { "rasi", "jsonc", "css" },
        command = 'echo ""',
      })

      api.nvim_create_autocmd("BufEnter", {
        pattern = "*.json",
        callback = function()
          vim.keymap.set(
            "n",
            "<S-f>",
            ":%!jq .<return>",
            { desc = "Format json file, depends on jq executable on system's path" }
          )
        end,
      })

      api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          if vim.bo.filetype == "json" then
            return
          end

          vim.keymap.set("n", "<S-f>", vim.lsp.buf.format, { desc = "Format file" })
        end,
      })

      api.nvim_create_autocmd("FileType", {
        pattern = { "txt", "exe", "min.*" },
        command = ":TSBufDisable highlight",
      })

      api.nvim_create_autocmd("BufEnter", {
        pattern = "CMakeLists.txt",
        command = ":TSBufEnable highlight",
      })

      api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        command = "set wrap",
      })
    '';
  };

  home.file.".config/nvim/lua/plugins/cmp.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "hrsh7th/nvim-cmp",
        opts = {
          experimental = {
            ghost_text = false,
          },
        },
        init = function()
          local cmp = require("cmp")

          cmp.setup({
            mapping = cmp.mapping.preset.insert({
              ['<CR>'] = cmp.mapping.confirm({select = false}),
            }),
            completion = {
              completeopt = 'menu,menuone,noinsert,noselect'
            },
          })
        end,
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/coding.lua" = {
    recursive = true;
    enable = true;
    text = ''

      return {
        -- Create annotations with one keybind, and jump your cursor in the inserted annotation
        {
          "danymat/neogen",
          keys = {
            {
              "<leader>cc",
              function()
                require("neogen").generate({})
              end,
              desc = "Neogen Comment",
            },
          },
          opts = { snippet_engine = "luasnip" },
        },

        -- Incremental rename
        {
          "smjonas/inc-rename.nvim",
          cmd = "IncRename",
          config = true,
        },

        -- Refactoring tool
        {
          "ThePrimeagen/refactoring.nvim",
          keys = {
            {
              "<leader>r",
              function()
                require("refactoring").select_refactor()
              end,
              mode = "v",
              noremap = true,
              silent = true,
              expr = false,
            },
          },
          opts = {},
        },

        -- Go forward/backward with square brackets
        {
          "echasnovski/mini.bracketed",
          event = "BufReadPost",
          config = function()
            local bracketed = require("mini.bracketed")
            bracketed.setup({
              file = { suffix = "" },
              window = { suffix = "" },
              quickfix = { suffix = "" },
              yank = { suffix = "" },
              treesitter = { suffix = "n" },
            })
          end,
        },

        -- Better increase/descrease
        {
          "monaqa/dial.nvim",
          -- stylua: ignore
          keys = {
            { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
            { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
          },
          config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
              default = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.date.alias["%Y/%m/%d"],
                augend.constant.alias.bool,
                augend.semver.alias.semver,
                augend.constant.new({ elements = { "let", "const" } }),
              },
            })
          end,
        },

        {
          "simrat39/symbols-outline.nvim",
          keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
          cmd = "SymbolsOutline",
          opts = {
            position = "right",
          },
        },
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/colorscheme.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        {
          "craftzdog/solarized-osaka.nvim",
          lazy = true,
          priority = 1000,
          opts = function()
            return {
              transparent = true,
            }
          end,
        },
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/dashboard.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "nvimdev/dashboard-nvim",
        enabled = false,
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/editor.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        {
          "tpope/vim-surround",
        },
        {
          enabled = false,
          "folke/flash.nvim",
          ---@type Flash.Config
          opts = {
            search = {
              forward = true,
              multi_window = false,
              wrap = false,
              incremental = true,
            },
          },
        },

        {
          "echasnovski/mini.hipatterns",
          event = "BufReadPre",
          opts = {
            highlighters = {
              hsl_color = {
                pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
                group = function(_, match)
                  local utils = require("solarized-osaka.hsl")
                  --- @type string, string, string
                  local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
                  --- @type number?, number?, number?
                  local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
                  --- @type string
                  local hex_color = utils.hslToHex(h, s, l)
                  return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                end,
              },
            },
          },
        },

        {
          "dinhhuy258/git.nvim",
          event = "BufReadPre",
          opts = {
            keymaps = {
              -- Open blame window
              blame = "<leader>gb",
              -- Open file/folder in git repository
              browse = "<leader>go",
            },
          },
        },
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/gitsigns.lua" = {
    recursive = true;
    enable = false;
    text = ''
      return {
        "lewis6991/gitsigns.nvim",
        enabled = false,
        event = "BufEnter",
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/lsp.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "neovim/nvim-lspconfig",
        event = "BufEnter",
        init = function()
          local keys = require("lazyvim.plugins.lsp.keymaps").get()

          keys[#keys + 1] = {
            "gd",
            function()
              -- DO NOT RESUSE WINDOW
              require("telescope.builtin").lsp_definitions({ reuse_win = false })
            end,
            desc = "Goto Definition",
            has = "definition",
          }
          local lsp = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")

          lsp.clangd.setup({
            capabilities = cmp_nvim_lsp.default_capabilities(),
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            },
          })

          lsp.rust_analyzer.setup({})
        end,
        opts = {
          inlay_hints = { enabled = false },
          ---@type lspconfig.options
          servers = {
            cssls = {},
            tailwindcss = {
              root_dir = function(...)
                return require("lspconfig.util").root_pattern(".git")(...)
              end,
            },
            tsserver = {
              root_dir = function(...)
                return require("lspconfig.util").root_pattern(".git")(...)
              end,
              single_file_support = false,
              settings = {
                typescript = {
                  inlayHints = {
                    includeInlayParameterNameHints = "literal",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  },
                },
                javascript = {
                  inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  },
                },
              },
            },
            html = {},
            yamlls = {
              settings = {
                yaml = {
                  keyOrdering = false,
                },
              },
            },
            lua_ls = {
              -- enabled = false,
              single_file_support = true,
              settings = {
                Lua = {
                  workspace = {
                    checkThirdParty = false,
                  },
                  completion = {
                    workspaceWord = true,
                    callSnippet = "Both",
                  },
                  misc = {
                    parameters = {
                      -- "--log-level=trace",
                    },
                  },
                  hint = {
                    enable = true,
                    setType = false,
                    paramType = true,
                    paramName = "Disable",
                    semicolon = "Disable",
                    arrayIndex = "Disable",
                  },
                  doc = {
                    privateName = { "^_" },
                  },
                  type = {
                    castNumberToInteger = true,
                  },
                  diagnostics = {
                    disable = { "incomplete-signature-doc", "trailing-space" },
                    -- enable = false,
                    groupSeverity = {
                      strong = "Warning",
                      strict = "Warning",
                    },
                    groupFileStatus = {
                      ["ambiguity"] = "Opened",
                      ["await"] = "Opened",
                      ["codestyle"] = "None",
                      ["duplicate"] = "Opened",
                      ["global"] = "Opened",
                      ["luadoc"] = "Opened",
                      ["redefined"] = "Opened",
                      ["strict"] = "Opened",
                      ["strong"] = "Opened",
                      ["type-check"] = "Opened",
                      ["unbalanced"] = "Opened",
                      ["unused"] = "Opened",
                    },
                    unusedLocalExclude = { "_*" },
                  },
                  format = {
                    enable = false,
                    defaultConfig = {
                      indent_style = "space",
                      indent_size = "2",
                      continuation_indent_size = "2",
                    },
                  },
                },
              },
            },
            -- csharp_ls = {},
            -- dagger = {},
            -- kotlin_language_server = {},
          },
          setup = {},
        },
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/lualine.lua" = {
    recursive = true;
    enable = true;
    text = ''
      -- helper function for lualine to identify selected columns
      -- currently it's not working base to start
      -- only start to back
      local function selection_count()
        local mode = vim.fn.mode()
        local col = vim.fn.col(".") - vim.fn.col("v") + 1

        -- print(string.format(vim.fn.col("v"), vim.fn.col("v") + 1))

        if mode:match("v") then
          return string.format("%d", math.abs(col))
        end

        return ""
      end

      return {

        "nvim-lualine/lualine.nvim",
        config = function()
          local status, lualine = pcall(require, "lualine")
          if not status then
            return
          end

          lualine.setup({
            options = {
              icons_enabled = true,
              theme = "solarized_dark",
              section_separators = { left = "", right = "" },
              component_separators = { left = "", right = "" },
              disabled_filetypes = {},
            },
            sections = {
              lualine_a = { "mode" }, -- mode
              lualine_b = { "branch" }, -- branch
              lualine_c = {
                {
                  "filename",
                  file_status = true, -- displays file status (readonly status, modified status)
                  path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
              },
              lualine_x = {
                {
                  "diagnostics",
                  sources = { "nvim_diagnostic" },
                  symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                  },
                },
                "fileformat",
                "encoding",
              },
              lualine_y = { "progress" }, -- progress
              lualine_z = { "location", { selection_count } },
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {
                {
                  "filename",
                  file_status = true, -- displays file status (readonly status, modified status)
                  path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
              },
              lualine_x = { "location" },
              lualine_y = {},
              lualine_z = {},
            },
            tabline = {},
            extensions = { "fugitive" },
          })
        end,
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/mason.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          vim.list_extend(opts.ensure_installed, {
            "stylua",
            "selene",
            "luacheck",
            "shellcheck",
            "shfmt",
            "tailwindcss-language-server",
            "typescript-language-server",
            "css-lsp",
          })
        end,
      }
          '';
        };

        home.file.".config/nvim/lua/plugins/telescope.lua" = {
          recursive = true;
          enable = true;
          text = ''

      return {
        "telescope.nvim",
        dependencies = {
          {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
          },
          "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
          {
            "<leader>fP",
            function()
              require("telescope.builtin").find_files({
                cwd = require("lazy.core.config").options.root,
              })
            end,
            desc = "Find Plugin File",
          },
          {
            ";f",
            function()
              local builtin = require("telescope.builtin")
              builtin.find_files({
                no_ignore = false,
                hidden = true,
              })
            end,
            desc = "Lists files in your current working directory, respects .gitignore",
          },
          {
            ";r",
            function()
              local builtin = require("telescope.builtin")
              builtin.live_grep({
                additional_args = { "--hidden" },
              })
            end,
            desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
          },
          {
            "\\\\",
            function()
              local builtin = require("telescope.builtin")
              builtin.buffers()
            end,
            desc = "Lists open buffers",
          },
          {
            ";t",
            function()
              local builtin = require("telescope.builtin")
              builtin.help_tags()
            end,
            desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
          },
          {
            ";;",
            function()
              local builtin = require("telescope.builtin")
              builtin.resume()
            end,
            desc = "Resume the previous telescope picker",
          },
          {
            ";e",
            function()
              local builtin = require("telescope.builtin")
              builtin.diagnostics()
            end,
            desc = "Lists Diagnostics for all open buffers or a specific buffer",
          },
          {
            ";s",
            function()
              local builtin = require("telescope.builtin")
              builtin.treesitter()
            end,
            desc = "Lists Function names, variables, from Treesitter",
          },
          {
            "sf",
            function()
              local telescope = require("telescope")

              local function telescope_buffer_dir()
                return vim.fn.expand("%:p:h")
              end

              telescope.extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = telescope_buffer_dir(),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = "normal",
                layout_config = { height = 40 },
              })
            end,
            desc = "Open File Browser with the path of the current buffer",
          },
        },
        config = function(_, opts)
          local telescope = require("telescope")
          local actions = require("telescope.actions")
          local fb_actions = require("telescope").extensions.file_browser.actions

          opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
            wrap_results = true,
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
            mappings = {
              n = {},
            },
          })
          opts.pickers = {
            diagnostics = {
              theme = "ivy",
              initial_mode = "normal",
              layout_config = {
                preview_cutoff = 9999,
              },
            },
          }
          opts.extensions = {
            file_browser = {
              theme = "dropdown",
              -- disables netrw and use telescope-file-browser in its place
              hijack_netrw = true,
              mappings = {
                -- your custom insert mode mappings
                ["n"] = {
                  -- your custom normal mode mappings
                  ["N"] = fb_actions.create,
                  ["h"] = fb_actions.goto_parent_dir,
                  ["/"] = function()
                    vim.cmd("startinsert")
                  end,
                  ["<C-u>"] = function(prompt_bufnr)
                    for i = 1, 10 do
                      actions.move_selection_previous(prompt_bufnr)
                    end
                  end,
                  ["<C-d>"] = function(prompt_bufnr)
                    for i = 1, 10 do
                      actions.move_selection_next(prompt_bufnr)
                    end
                  end,
                  ["<PageUp>"] = actions.preview_scrolling_up,
                  ["<PageDown>"] = actions.preview_scrolling_down,
                },
              },
            },
          }
          telescope.setup(opts)
          require("telescope").load_extension("fzf")
          require("telescope").load_extension("file_browser")
        end,
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/treesitter.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

        {
          "nvim-treesitter/nvim-treesitter",
          event = "BufEnter",
          opts = {
            ensure_installed = {
              "astro",
              "cmake",
              "cpp",
              "css",
              "fish",
              "gitignore",
              "go",
              "graphql",
              "http",
              "java",
              "php",
              "rust",
              "scss",
              "sql",
              "svelte",
            },

            -- matchup = {
            -- 	enable = true,
            -- },

            -- https://github.com/nvim-treesitter/playground#query-linter
            query_linter = {
              enable = true,
              use_virtual_text = true,
              lint_events = { "BufWrite", "CursorHold" },
            },

            playground = {
              enable = true,
              disable = {},
              updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
              persist_queries = true, -- Whether the query persists across vim sessions
              keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
              },
            },
          },
          config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            -- MDX
            vim.filetype.add({
              extension = {
                mdx = "mdx",
              },
            })
            vim.treesitter.language.register("markdown", "mdx")
          end,
        },
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/ui.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        -- messages, cmdline and the popupmenu
        {
          "folke/noice.nvim",
          -- enabled = false,
          opts = function(_, opts)
            opts.lsp = {
              progress = {
                enabled = false,
              },
              hover = {
                silent = true,
              },
            }
            -- table.insert(opts.routes, {
            --   filter = {
            --     event = "notify",
            --     find = "No information available",
            --   },
            --   opts = { skip = true },
            -- })
            -- local focused = true
            -- vim.api.nvim_create_autocmd("FocusGained", {
            --   callback = function()
            --     focused = true
            --   end,
            -- })
            -- vim.api.nvim_create_autocmd("FocusLost", {
            --   callback = function()
            --     focused = false
            --   end,
            -- })
            -- table.insert(opts.routes, 1, {
            --   filter = {
            --     cond = function()
            --       return not focused
            --     end,
            --   },
            --   view = "notify_send",
            --   opts = { stop = false },
            -- })
            --
            -- opts.commands = {
            --   all = {
            --     -- options for the message history that you get with `:Noice`
            --     view = "split",
            --     opts = { enter = true, format = "details" },
            --     filter = {},
            --   },
            -- }
            --
            -- vim.api.nvim_create_autocmd("FileType", {
            --   pattern = "markdown",
            --   callback = function(event)
            --     vim.schedule(function()
            --       require("noice.text.markdown").keys(event.buf)
            --     end)
            --   end,
            -- })
            --
            -- opts.presets.lsp_doc_border = true
          end,
        },

        {
          "rcarriga/nvim-notify",
          opts = {
            timeout = 5000,
          },
        },

        -- animations
        {
          "echasnovski/mini.animate",
          enabled = false,
          event = "VeryLazy",
          opts = function(_, opts)
            opts.scroll = {
              enable = false,
            }
          end,
        },

        -- buffer line
        {
          "akinsho/bufferline.nvim",
          event = "VeryLazy",
          keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
          },
          opts = {
            options = {
              mode = "tabs",
              -- separator_style = "slant",
              show_buffer_close_icons = false,
              show_close_icon = false,
            },
          },
        },

        -- filename
        {
          "b0o/incline.nvim",
          enabled = false,
          dependencies = { "craftzdog/solarized-osaka.nvim" },
          event = "BufReadPre",
          priority = 1200,
          config = function()
            local colors = require("solarized-osaka.colors").setup()
            require("incline").setup({
              highlight = {
                groups = {
                  InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
                  InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
                },
              },
              window = { margin = { vertical = 0, horizontal = 1 } },
              hide = {
                cursorline = true,
              },
              render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

                if vim.bo[props.buf].modified then
                  filename = "[+] " .. filename
                end

                local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                return { { icon, guifg = color }, { " " }, { filename } }
              end,
            })
          end,
        },

        {
          "lukas-reineke/indent-blankline.nvim",
          enabled = false,
        }
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/which-key.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "folke/which-key.nvim",
        enabled = false,
      }
    '';
  };

  home.file.".config/nvim/lua/plugins/zen-mode.lua" = {
    recursive = true;
    enable = true;
    text = ''
      return {
        "folke/zen-mode.nvim",
        event = "BufEnter",
        cmd = "ZenMode",
        opts = {
          plugins = {
            gitsigns = true,
            tmux = true,
            kitty = { enabled = false, font = "+2" },
          },
        },
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
      }
    '';
  };

  home.file.".config/nvim/lua/rafaeloledo/hsl.lua" = {
    recursive = true;
    enable = true;
    text = ''
      -- https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua

      local M = {}

      local hexChars = "0123456789abcdef"

      function M.hex_to_rgb(hex)
        hex = string.lower(hex)
        local ret = {}
        for i = 0, 2 do
          local char1 = string.sub(hex, i * 2 + 2, i * 2 + 2)
          local char2 = string.sub(hex, i * 2 + 3, i * 2 + 3)
          local digit1 = string.find(hexChars, char1) - 1
          local digit2 = string.find(hexChars, char2) - 1
          ret[i + 1] = (digit1 * 16 + digit2) / 255.0
        end
        return ret
      end

      --[[
      * Converts an RGB color value to HSL. Conversion formula
      * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
      * Assumes r, g, and b are contained in the set [0, 255] and
      * returns h, s, and l in the set [0, 1].
      *
      * @param   Number  r       The red color value
      * @param   Number  g       The green color value
      * @param   Number  b       The blue color value
      * @return  Array           The HSL representation
      ]]
      function M.rgbToHsl(r, g, b)
        local max, min = math.max(r, g, b), math.min(r, g, b)
        local h = 0
        local s = 0
        local l = 0

        l = (max + min) / 2

        if max == min then
          h, s = 0, 0 -- achromatic
        else
          local d = max - min
          if l > 0.5 then
            s = d / (2 - max - min)
          else
            s = d / (max + min)
          end
          if max == r then
            h = (g - b) / d
            if g < b then
              h = h + 6
            end
          elseif max == g then
            h = (b - r) / d + 2
          elseif max == b then
            h = (r - g) / d + 4
          end
          h = h / 6
        end

        return h * 360, s * 100, l * 100
      end

      --[[
      * Converts an HSL color value to RGB. Conversion formula
      * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
      * Assumes h, s, and l are contained in the set [0, 1] and
      * returns r, g, and b in the set [0, 255].
      *
      * @param   Number  h       The hue
      * @param   Number  s       The saturation
      * @param   Number  l       The lightness
      * @return  Array           The RGB representation
      ]]
      function M.hslToRgb(h, s, l)
        local r, g, b

        if s == 0 then
          r, g, b = l, l, l -- achromatic
        else
          function hue2rgb(p, q, t)
            if t < 0 then
              t = t + 1
            end
            if t > 1 then
              t = t - 1
            end
            if t < 1 / 6 then
              return p + (q - p) * 6 * t
            end
            if t < 1 / 2 then
              return q
            end
            if t < 2 / 3 then
              return p + (q - p) * (2 / 3 - t) * 6
            end
            return p
          end

          local q
          if l < 0.5 then
            q = l * (1 + s)
          else
            q = l + s - l * s
          end
          local p = 2 * l - q

          r = hue2rgb(p, q, h + 1 / 3)
          g = hue2rgb(p, q, h)
          b = hue2rgb(p, q, h - 1 / 3)
        end

        return r * 255, g * 255, b * 255
      end

      function M.hexToHSL(hex)
        local hsluv = require("solarized-osaka.hsluv")
        local rgb = M.hex_to_rgb(hex)
        local h, s, l = M.rgbToHsl(rgb[1], rgb[2], rgb[3])

        return string.format("hsl(%d, %d, %d)", math.floor(h + 0.5), math.floor(s + 0.5), math.floor(l + 0.5))
      end

      --[[
      * Converts an HSL color value to RGB in Hex representation.
      * @param   Number  h       The hue
      * @param   Number  s       The saturation
      * @param   Number  l       The lightness
      * @return  String           The hex representation
      ]]
      function M.hslToHex(h, s, l)
        local r, g, b = M.hslToRgb(h / 360, s / 100, l / 100)

        return string.format("#%02x%02x%02x", r, g, b)
      end

      function M.replaceHexWithHSL()
        -- Get the current line number
        local line_number = vim.api.nvim_win_get_cursor(0)[1]

        -- Get the line content
        local line_content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

        -- Find hex code patterns and replace them
        for hex in line_content:gmatch("#[0-9a-fA-F]+") do
          local hsl = M.hexToHSL(hex)
          line_content = line_content:gsub(hex, hsl)
        end

        -- Set the line content back
        vim.api.nvim_buf_set_lines(0, line_number - 1, line_number, false, { line_content })
      end

      return M
    '';
  };

  home.file.".config/nvim/lua/rafaeloledo/lsp.lua" = {
    recursive = true;
    enable = true;
    text = ''
      local M = {}

      function M.toggleInlayHints()
        vim.lsp.inlay_hint.enable(1, not vim.lsp.inlay_hint.is_enabled())
      end

      return M
    '';
  };

  home.file.".config/nvim/lazyvim.json" = {
    recursive = true;
    enable = true;
    text = ''
      {
        "extras": [

        ],
        "news": {
          "NEWS.md": "4964",
          "doc/news.txt": "24920"
        },
        "version": 6
      }
    '';
  };

  home.file.".config/nvim/stylua.toml" = {
    recursive = true;
    enable = true;
    text = ''
      indent_type = "Spaces"
      indent_width = 2
      column_width = 120
    '';
  };

  home.file.".config/nvim/.neoconf.json" = {
    recursive = true;
    enable = true;
    text = ''
      {
        "neodev": {
          "library": {
            "enabled": true,
            "plugins": true
          }
        },
        "neoconf": {
          "plugins": {
            "lua_ls": {
              "enabled": true
            }
          }
        }
      }
    '';
  };

}
