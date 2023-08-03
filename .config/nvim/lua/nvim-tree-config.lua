local map = vim.keymap

-- == NVIM Tree Maps == --
map.set("n", "<leader>t", "<cmd>lua require('nvim-tree.api').tree.focus()<CR>")
