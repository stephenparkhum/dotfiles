return {
  -- Color scheme
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
      require("catppuccin").setup({
        integrations = {
          ts_rainbow = true,
          which_key = true,
          ts_rainbow2 = true,
          coc_nvim = true,
          cmp = true,
          dap = true,
          gitsigns = true,
          nvimtree = true,
          mason = true,
          harpoon = true,
          treesitter = true,
          telescope = {
            enabled = true,
          },
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        }
      })
    end,
  },
  -- Required by a lot of things
  {
    "nvim-tree/nvim-web-devicons",
    after = "catppuccin/nvim",
  },
  -- Mason
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "yamlls", "cssls", "tsserver", "eslint", "html", "jsonls", "tailwindcss", "emmet_ls",
          "marksman", "lua_ls", "cssmodules_ls" }
      })
    end
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        dim = true,
        highlight_on_key = true
      }
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
        end,
      })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- LSP Autocomplete
  'hrsh7th/cmp-path',
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",             -- source for file system paths in commands
      "L3MON4D3/LuaSnip",             -- snippet engine
      "saadparwaiz1/cmp_luasnip",     -- for lua autocompletion
      "rafamadriz/friendly-snippets", -- useful snippet library
    },
  },
  -- Smart Comments
  'tpope/vim-commentary',
  'kylechui/nvim-surround',
  -- Git Plugins
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
  'yorickpeterse/nvim-pqf',
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require('nvim-treesitter').setup(
        {
          event = { "BufReadPre", "BufNewFile" },
          ignore_install = {},
          ensure_installed = {
            "cpp",
            "gitignore",
            "javascript",
            "typescript",
            "tsx",
            "comment",
            "lua",
            "css",
            "vim",
            "vimdoc",
            "dockerfile",
            "json",
            "html",
            "rust",
            "scss",
            "solidity",
            "styled",
            "swift",
            "toml",
            "markdown_inline",
            "yaml",
            "bash",
          },
          sync_install = true,
          highlight = {
            enable = true,
            use_languagetree = true,
          },
          query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { "BufWrite", "CursorHold" },
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = false,
              node_decremental = "<bs>",
            },
          },
          indent = { enable = true },
          modules = {},
          autotag = {
            enable = true,
            filetypes = {
              "javascript",
              "typescript",
              "tsx",
              "html"
            }
          },
          auto_install = true,
        }
      )
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup({
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies =
    'nvim-tree/nvim-web-devicons'
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  -- Buffer Navigation
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'catppuccin',
        sections = {
          lualine_x = { 'fileformat', 'filetype' },
        },
      }
    }
  },
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  -- Telescope
  'nvim-telescope/telescope-project.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'nvim-telescope/telescope-ui-select.nvim',
  'debugloop/telescope-undo.nvim',
  -- File browsing
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "j-hui/fidget.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )
      local servers = {
        "lua_ls",
        "tsserver",
        "clangd",
        "cssls",       -- css-lsp
        "html",        -- html-lsp
        "lua_ls",      -- lua-language-server
        "rust_analyzer",
        "tailwindcss", -- tailwindcss-language-server
        "tsserver",    -- typescript-language-server
        "yamlls",      -- yaml-language-server
      }
      local formatters = {
        "black",
        "clang_format",
        "isort",
        "prettier",
        "prettierd",
        "stylua",
        "pyright",
      }
      local ensure_installed = vim.tbl_extend("keep", servers, formatters)

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = "Lua 5.1" },
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
        },
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- TODO: Maybe don't need?
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- TODO: Maybe don't need?
        }, {
          -- TODO: What about path?
          { name = "buffer" },
        }),
      })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
  'neovim/nvim-lspconfig',
  'MunifTanjim/prettier.nvim',
  { 'onsails/lspkind.nvim' },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { 'MunifTanjim/eslint.nvim' },
  -- Grammar checking because I can't english
  { 'rhysd/vim-grammarous' },
  -- TODO Comments Highlighting
  { 'folke/todo-comments.nvim' },
  ------------------------ VIM TSX ------------------------
  -- by default, if you open tsx file, neovim does not show syntax colors
  { 'ianks/vim-tsx' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  -- Fullstack Web Dev
  { 'pangloss/vim-javascript' },
  { 'mattn/emmet-vim' },
  'leafgarland/typescript-vim',
  --Vim Snippets
  { 'phux/vim-snippets' },
  --Number Toggle -- toggles relative numbers on and off
  { 'jeffkreeftmeijer/vim-numbertoggle' },
  --Lightbulb in LSP Code action
  -- { 'kosayoda/nvim-lightbulb' },
  --Smart Buffer
  { 'johann2357/nvim-smartbufs' },
  { 'MunifTanjim/prettier.nvim' },
  "axelvc/template-string.nvim",
  'tiagovla/scope.nvim',
  'airblade/vim-gitgutter',
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  'simrat39/rust-tools.nvim',
  {
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()
    end,
  }
}
