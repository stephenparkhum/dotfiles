local set_local = vim.opt
local set_global = vim.g
set_global.loaded_netrw = 1
set_global.loaded_netrwPlugin = 1
set_local.encoding = "utf-8"
vim.scriptencoding = 'utf-8'

-- use space as a the leader key
set_global.mapleader = ' '
set_global.maplocalleader = ' '

-- CUSTOM SETUPS --
require("options")
local plugs = require("plugins")
require("maps")
-- require("theme")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
set_local.rtp:prepend(lazypath)

require("lazy").setup(plugs, {
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = false },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("telescope-config")
require("cmp-config")
-- LSP config
require("p-lsp-config")
--require("spdev")

require("null-ls-config")
require("prettier-config")

-- Fzf Config
require("fzf-config")

-- Nvim Smart buffers custom - keep at the end
require("nvim-smartbufs-config")

-- Harpoon
require("harpoon-config")
