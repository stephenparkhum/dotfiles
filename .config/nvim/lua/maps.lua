local map = vim.keymap
-- == GENERAL NEOVIM == --
map.set("n", "<leader>so", "<cmd>:so %<CR>")
map.set("n", "<leader><CR>", "<cmd>:source ~/.config/nvim/init.vim<CR>")

-- == GENERAL MOVES == --
map.set("n", "J", "5j")
map.set("n", "K", "5k")
map.set("v", "J", "5j")
map.set("v", "K", "5k")

-- == BUFFER NAV == --
map.set("n", "<leader>B", "<cmd>:bp<CR>")
map.set("n", "<leader>bn", "<cmd>:bnext<CR>")
map.set("n", "<leader>bp", "<cmd>:bprevious<CR>")
map.set("n", "<leader>bf", "<cmd>:bfirst<CR>")
map.set("n", "<leader>bl", "<cmd>:blast<CR> ")
map.set("n", "<Leader>1", ":lua require('nvim-smartbufs').goto_buffer(1)<CR>")
map.set("n", "<Leader>2", ":lua require('nvim-smartbufs').goto_buffer(2)<CR>")
map.set("n", "<Leader>3", ":lua require('nvim-smartbufs').goto_buffer(3)<CR>")
map.set("n", "<Leader>4", ":lua require('nvim-smartbufs').goto_buffer(4)<CR>")
map.set("n", "<Leader>5", ":lua require('nvim-smartbufs').goto_buffer(5)<CR>")
map.set("n", "<Leader>6", ":lua require('nvim-smartbufs').goto_buffer(6)<CR>")
map.set("n", "<Leader>7", ":lua require('nvim-smartbufs').goto_buffer(7)<CR>")
map.set("n", "<Leader>8", ":lua require('nvim-smartbufs').goto_buffer(8)<CR>")
map.set("n", "<Leader>9", ":lua require('nvim-smartbufs').goto_buffer(9)<CR>")

-- == TELESCOPE NAV == --
map.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
map.set("n", "<leader>pf", "<cmd>Telescope git_files<CR>")
map.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map.set("n", "<leader>ne", "<cmd>Telescope file_browser<CR>")
map.set("n", "<leader>cf", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>")

-- == WINDOW MOVES == --
map.set("n", "<leader>l", "<C-W>l")
map.set("n", "<leader>k", "<C-W>k")
map.set("n", "<leader>h", "<C-W>h")
map.set("n", "<leader>j", "<C-W>j")

-- == CODE ACTIONS== --
map.set("n", "<leader>f", "<cmd>:call CocAction('format')<CR>")

-- This is broken for some reason
-- vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>")
