local map = vim.keymap
-- == GENERAL NEOVIM == --
map.set("n", "<leader>so", "<cmd>:so<CR>")

-- == GENERAL MOVES == --
map.set("n", "J", "5j")
map.set("n", "K", "5k")
map.set("v", "J", "5j")
map.set("v", "K", "5k")
-- Commenting this out for now, so I can try out the tooltip thing

-- == BUFFER NAV == --
map.set("n", "<leader>B", "<cmd>:bp<CR>")

-- == TELESCOPE NAV == --
map.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
map.set("n", "<leader>pf", "<cmd>Telescope git_files<CR>")
map.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map.set("n", "<leader>cf", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>")

-- == WINDOW MOVES == --
map.set("n", "<leader>l", "<C-W>l")
map.set("n", "<leader>k", "<C-W>k")
map.set("n", "<leader>h", "<C-W>h")
map.set("n", "<leader>j", "<C-W>j")

-- This is broken for some reason
-- vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>")

-- Source config
map.set("n", "<leader>so", "<cmd>:so %<CR>")
