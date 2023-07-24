return {
  -- Color scheme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
    lazy = true,
    event = "VeryLazy"
  },
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
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "erlang",
          "heex",
          "eex",
          "java",
          "kotlin",
          "jq",
          "dockerfile",
          "json",
          "html",
          "terraform",
          "go",
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
  -- Nerd Tree
  { 'preservim/nerdtree' },
  { 'Xuyuanp/nerdtree-git-plugin' },
  -- Dev icons
  { 'ryanoasis/vim-devicons' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'tiagofumo/vim-nerdtree-syntax-highlight' },
  { 'nvim-treesitter/nvim-treesitter' },
  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end
  },
  { 'ellisonleao/glow.nvim' },
  { 'akinsho/bufferline.nvim',   version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'NvChad/nvim-colorizer.lua', ft = { "css" } },
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
    config = function()
      -- ...
    end,
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
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'MunifTanjim/eslint.nvim' },
  -- Debugging
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'nvim-telescope/telescope-dap.nvim' },
  -- Grammar checking because I can't english
  { 'rhysd/vim-grammarous' },
  -- TODO Comments Highlighting
  { 'folke/todo-comments.nvim' },
  ------------------------ VIM TSX ------------------------
  -- by default, if you open tsx file, neovim does not show syntax colors
  { 'ianks/vim-tsx' },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
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
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
  },
}
