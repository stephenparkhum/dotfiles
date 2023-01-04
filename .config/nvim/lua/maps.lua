-- == GENERAL NEOVIM == --
vim.keymap.set("n", "<leader>so", "<cmd>:so<CR>")
-- vim.keymap.set("n", "jk", "<ESC>")

-- == GENERAL MOVES == --
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")
vim.keymap.set("v", "J", "5j")
vim.keymap.set("v", "K", "5k")

-- == BUFFER NAV == --
vim.keymap.set("n", "<leader>B", "<cmd>:bp<CR>")

-- == TELESCOPE NAV == --
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>pf", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>")

-- == WINDOW MOVES == --
vim.keymap.set("n", "<leader>l", "<C-W>l")
vim.keymap.set("n", "<leader>k", "<C-W>k")
vim.keymap.set("n", "<leader>h", "<C-W>h")
vim.keymap.set("n", "<leader>j", "<C-W>j")

-- This is broken for some reason
-- vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>")
