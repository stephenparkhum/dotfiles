local set_local = vim.opt
local set_global = vim.g
set_local.encoding = "utf-8"

-- use space as a the leader key
set_global.mapleader = ' '
set_global.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- LSP config
require("lsp")
require("spdev")

-- Nvim Tree customs - keep at the end
require("nvim-tree-config")

-- Nvim Smart buffers custom - keep at the end
require("nvim-smartbufs-config")
