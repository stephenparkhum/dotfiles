require("options")
require("lazy").setup()
require("after.lazy-config")

-- Custom Setups
require("maps")
require("lua.lsp-config")
require("options")
require("plugins")
require("spdev")
require("theme")

vim.cmd([[
set notimeout
set encoding=utf-8
]])

local set = vim.opt
local set_global = vim.g

-- use space as a the leader key
set_global.mapleader = ' '

set.encoding = "utf-8"

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.relativenumber = true


-- Nvim autopairs
require("nvim-autopairs").setup({})

-- Bufferline setup
require("bufferline").setup({})
