local map = vim.keymap
-- == GENERAL NEOVIM == --
map.set("n", "<leader>so", "<cmd>:so %<CR>")

-- == GENERAL MOVES == --
-- Exit insert mode without hitting Esc
map.set("i", "jj", "<Esc>")
map.set("n", "J", "5j")
map.set("n", "K", "5k")
map.set("v", "J", "5j")
map.set("v", "K", "5k")

-- == Oil Nav == --
map.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- == undotree == --
map.set("n", "<leader>u", "<cmd>:UndoTreeToggle<CR>")

-- == BUFFER NAV == --
map.set("n", "<leader>b", "<cmd>:bp<CR>")
map.set("n", "<leader>bn", "<cmd>:bnext<CR>")
map.set("n", "<leader>bp", "<cmd>:bprevious<CR>")
map.set("n", "<leader>bf", "<cmd>:bfirst<CR>")
map.set("n", "<leader>bl", "<cmd>:blast<CR>")

-- == NVIM SMARTBUFS == --
map.set("n", "<Right>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>")
map.set("n", "<Left>", ":lua require('nvim-smartbufs').goto_left_buffer()<CR>")
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
