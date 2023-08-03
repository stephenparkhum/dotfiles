vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

local map = vim.keymap

-- Improved :bnext :bprev behavior (without considering terminal buffers)
map.set("n", "<Right>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>")
map.set("n", "<Left>", ":lua require('nvim-smartbufs').goto_left_buffer()<CR>")

-- map the rest of the n

map.set("n", "<leader>1", ":lua require('nvim-smartbufs').goto_buffer(1)<CR>")
map.set("n", "<leader>2", ":lua require('nvim-smartbufs').goto_buffer(2)<CR>")
map.set("n", "<leader>3", ":lua require('nvim-smartbufs').goto_buffer(3)<CR>")
map.set("n", "<leader>4", ":lua require('nvim-smartbufs').goto_buffer(4)<CR>")
map.set("n", "<leader>5", ":lua require('nvim-smartbufs').goto_buffer(5)<CR>")
map.set("n", "<leader>6", ":lua require('nvim-smartbufs').goto_buffer(6)<CR>")
map.set("n", "<leader>7", ":lua require('nvim-smartbufs').goto_buffer(7)<CR>")
map.set("n", "<leader>8", ":lua require('nvim-smartbufs').goto_buffer(8)<CR>")
map.set("n", "<leader>9", ":lua require('nvim-smartbufs').goto_buffer(9)<CR>")
