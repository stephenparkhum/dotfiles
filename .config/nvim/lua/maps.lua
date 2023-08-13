local map = vim.keymap
-- == GENERAL NEOVIM == --
map.set("n", "<leader>so", "<cmd>:so %<CR>")
map.set("n", "<leader><CR>", "<cmd>:source ~/.config/nvim/init.vim<CR>")

-- == GENERAL MOVES == --
-- Exit insert mode without hitting Esc
map.set("i", "jj", "<Esc>")
map.set("n", "J", "5j")
map.set("n", "K", "5k")
map.set("v", "J", "5j")
map.set("v", "K", "5k")

-- == Neotree Nav == --
map.set("n", "<leader>t", "<cmd>:Neotree<CR>")
map.set("n", "<leader>t", "<cmd>:Neotree<CR>")

-- == BUFFER NAV == --
map.set("n", "<leader>B", "<cmd>:bp<CR>")
map.set("n", "<leader>bn", "<cmd>:bnext<CR>")
map.set("n", "<leader>bp", "<cmd>:bprevious<CR>")
map.set("n", "<leader>bf", "<cmd>:bfirst<CR>")
map.set("n", "<leader>bl", "<cmd>:blast<CR> ")

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
map.set("n", "ccd", ":CocList diagnostics<CR>")

-- This is broken for some reason
map.set("n", "<leader>fp", "<cmd>Telescope project<CR>")
