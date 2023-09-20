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
        ensure_installed = { "cssls", "tsserver", "tailwindcss", "emmet_ls",
          "rust_analyzer", "lua_ls" }
      })
    end
  },
  { 'merrickluo/lsp-tailwindcss' },
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
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        name = {
          use_git_status_colors = true,
          highlight = "NeoTreeFileName"
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        window = {
          width = 34
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
    end
  },
  { 's1n7ax/nvim-window-picker' },
  -- LSP Autocomplete
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
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
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    }
  },
  -- Dev icons
  { 'nvim-tree/nvim-web-devicons' },
  "nvim-treesitter/nvim-treesitter-context",
  "p00f/nvim-ts-rainbow",
  "axelvc/template-string.nvim",
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
  -- Smart Comments
  'tpope/vim-commentary',
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
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').setup(
        {
          ignore_install = {},
          ensure_installed = {
            "javascript",
            "typescript",
            "comment",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "dockerfile",
            "json",
            "html",
            "tsx",
            "yaml",
            "bash",
            "ruby",
          },
          sync_install = true,
          highlight = {
            enable = true,
            use_languagetree = true,
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
  { 'akinsho/bufferline.nvim',    version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
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
  { 'nvim-telescope/telescope-project.nvim' },
  -- Telescope fzf
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
  {
    'MunifTanjim/prettier.nvim'
  },
  -- Git
  { 'dinhhuy258/git.nvim' },
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
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'MunifTanjim/prettier.nvim' },
}
