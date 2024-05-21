local set_local = vim.opt
local set_global = vim.g
set_global.loaded_netrw = 1
set_global.loaded_netrwPlugin = 1
set_local.encoding = "utf-8"
set_local.shell = "/bin/zsh"
vim.scriptencoding = 'utf-8'

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

local plugs = require("plugins")

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
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit"
      },
    },
  },
})


-- use space as a the leader key
set_global.mapleader = ' '
set_global.maplocalleader = ' '

-- DEFAULT SETUPS --
require("options")
require("maps")

-- Setup "Comment" plugin
require('Comment').setup()

-- PLUGIN CONFIGS
require("plugins.telescope")
-- require("plugins.cmp")
require("plugins.p-lsp")
require("plugins.prettier")
require("plugins.harpoon")
