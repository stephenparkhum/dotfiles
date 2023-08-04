return {
  -- Color scheme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  -- Nvim Tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    version = "*",
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true
          }
        }
      })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- LSP Autocomplete
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',              -- Required
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',  -- Optional
      'hrsh7th/nvim-cmp',                   -- Required
      'hrsh7th/cmp-nvim-lsp',               -- Required
      'L3MON4D3/LuaSnip',                   -- Required
      "rafamadriz/friendly-snippets",
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    }
  },
  -- Dev icons
  { 'nvim-tree/nvim-web-devicons' },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    lazy = true,
    event = "VeryLazy"
  },
  'tiagovla/scope.nvim',
  'airblade/vim-gitgutter',
  'nvim-telescope/telescope-ui-select.nvim',
  'debugloop/telescope-undo.nvim',
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
    end
  },
  'kylechui/nvim-surround',
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        modules = {},
        auto_install = true,
        ignore_install = {},
        ensure_installed = {
          "javascript",
          "typescript",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "jq",
          "dockerfile",
          "json",
          "html",
          "tsx",
          "bash",
          "ruby",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'github/copilot.vim' },
  { 'akinsho/bufferline.nvim',        version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
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
    config = {
      options = {
        theme = 'catppuccin'
      }
    }
  },
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },
  -- Telescope
  -- Telescope fzf
  { 'nvim-telescope/telescope-project.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- File browsing
  { 'nvim-telescope/telescope-file-browser.nvim' },
  -- ESLINT LSP
  {
    'neovim/nvim-lspconfig',
  },
  { 'jose-elias-alvarez/null-ls.nvim' },
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
  { 'leafgarland/typescript-vim' },
  { 'maxmellon/vim-jsx-pretty' },
  { 'mattn/emmet-vim' },
  --Vim Snippets
  { 'phux/vim-snippets' },

  --Number Toggle -- toggles relative numbers on and off
  { 'jeffkreeftmeijer/vim-numbertoggle' },

  --Lightbulb in LSP Code action
  { 'kosayoda/nvim-lightbulb' },
  { 'antoinemadec/FixCursorHold.nvim' },
  --Airline status bar
  { 'vim-airline/vim-airline' },
  --Smart Buffer
  { 'johann2357/nvim-smartbufs' },
  --Rust Plugins
  { 'rust-lang/rust.vim' },
  'nathom/tmux.nvim',
  --Git
  -- {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   config = function()
  --   end,
  --   dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  -- },
}
