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

local MyGroup = augroup("Group Yeah", {})

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

autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})
autocmd("LspAttach", {
  group = MyGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)
  end,
})
-- Setup "Comment" plugin
require('Comment').setup()
