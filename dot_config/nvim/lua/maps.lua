local map = vim.keymap
-- == GENERAL NEOVIM == --
map.set("n", "<leader>so", "<cmd>:so %<CR>")

-- == GENERAL MOVES == --
-- Exit insert mode without hitting Esq
map.set("i", "jj", "<Esc>")
map.set("n", "J", "5j")
map.set("n", "K", "5k")
map.set("v", "J", "5j")
map.set("v", "K", "5k")

-- == Oil Nav == --
map.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- == Undotree == --
map.set("n", "<leader>u", "<cmd>:UndoTreeToggle<CR>")

-- == DEBUGGING == --
map.set("n", "<leader>bp", ":lua require'dap'.toggle_breakpoint()")

-- == NVIM SMARTBUFS == --
map.set("n", "<leader>1", ":lua require('nvim-smartbufs').goto_buffer(1)<CR>")
map.set("n", "<leader>2", ":lua require('nvim-smartbufs').goto_buffer(2)<CR>")
map.set("n", "<leader>3", ":lua require('nvim-smartbufs').goto_buffer(3)<CR>")
map.set("n", "<leader>4", ":lua require('nvim-smartbufs').goto_buffer(4)<CR>")
map.set("n", "<leader>5", ":lua require('nvim-smartbufs').goto_buffer(5)<CR>")
map.set("n", "<leader>6", ":lua require('nvim-smartbufs').goto_buffer(6)<CR>")
map.set("n", "<leader>7", ":lua require('nvim-smartbufs').goto_buffer(7)<CR>")
map.set("n", "<leader>8", ":lua require('nvim-smartbufs').goto_buffer(8)<CR>")
map.set("n", "<leader>9", ":lua require('nvim-smartbufs').goto_buffer(9)<CR>")

-- == WINDOW MOVES == --
map.set("n", "<leader>l", "<C-W>l")
map.set("n", "<leader>k", "<C-W>k")
map.set("n", "<leader>h", "<C-W>h")
map.set("n", "<leader>j", "<C-W>j")
