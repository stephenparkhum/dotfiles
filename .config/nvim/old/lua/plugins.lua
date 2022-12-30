local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato"
      }
      vim.api.nvim_command "colorscheme catppuccin"
    end
  }

  use 'kyazdani42/nvim-web-devicons' -- File icons - way more appealing
  use 'hoob3rt/lualine.nvim' -- Status line
  use 'onsails/lspkind-nvim' -- vscode like pictograms
  use 'L3MON4D3/LuaSnip' -- something else
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- completion
  use 'neovim/nvim-lspconfig' -- LSP Config
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'cljoly/telescope-repo.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }

  -- Extended capabilities for telescope
  use 'sharkdp/fd'

  -- CSS Color Support
  use 'ap/vim-css-color'

  -- Smart Comments
  use 'tpope/vim-commentary'

  -- TypeScript Stuff
  use 'leafgarland/typescript-vim'

end)
