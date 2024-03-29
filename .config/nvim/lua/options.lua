--Add options here
local set = vim.opt

local tab_shift = 2

set.ma = true
set.termguicolors = true
set.clipboard = 'unnamedplus'
set.rnu = false
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
set.wrap = true
set.swapfile = false
set.foldlevelstart = 99
set.scrolloff = 7
set.relativenumber = false
set.colorcolumn = "120"
set.hlsearch = false
set.incsearch = true
set.tw = 64
set.scrolloff = tab_shift * 5
set.sidescrolloff = tab_shift * 5
set.backupskip = '/tmp/*,/private/tmp/*'
