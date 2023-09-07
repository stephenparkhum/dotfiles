--Add options here
local set = vim.opt

local tab_shift = 2

set.ma = true
set.clipboard = 'unnamedplus'
set.termguicolors = true
set.rnu = true
set.mouse = 'a'
set.cursorline = true
set.tabstop = tab_shift
set.shiftwidth = tab_shift
set.softtabstop = tab_shift
set.expandtab = true
set.autoread = true
set.backup = false
set.writebackup = false
set.smartindent = true
set.smarttab = true
set.number = true
set.relativenumber = true
set.wrap = false
set.swapfile = false
set.foldlevelstart = 99
set.scrolloff = 7
set.relativenumber = true
set.colorcolumn = "100"
set.hlsearch = false
set.incsearch = true
set.tw = 64
set.scrolloff = tab_shift * 5
set.sidescrolloff = tab_shift * 5
set.shell = 'zsh'
set.backupskip = '/tmp/*,/private/tmp/*'
