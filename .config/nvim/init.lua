local set_local = vim.opt
local set_global = vim.g
set_global.loaded_netrw = 1
set_global.loaded_netrwPlugin = 1
set_local.encoding = "utf-8"
set_local.shell = "/bin/zsh"
vim.scriptencoding = 'utf-8'

-- use space as a the leader key
set_global.mapleader = ' '
set_global.maplocalleader = ' '

-- DEFAULT SETUPS --
require("options")
require("lazy_init")
require("maps")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Setup "Comment" plugin
require('Comment').setup()
