-- Add general Noevim options here
local set = vim.opt
local tab_shift = 2
local global = vim.g

set.ma = true
set.termguicolors = true
set.clipboard = 'unnamedplus'
set.rnu = false
set.timeoutlen = 300
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
set.scrolloff = 10
set.relativenumber = false
set.colorcolumn = "120"
set.hlsearch = false
set.incsearch = true
set.tw = 64
set.scrolloff = tab_shift * 5
set.sidescrolloff = tab_shift * 5
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.backupskip = '/tmp/*,/private/tmp/*'

global.copilot_enabled = false
