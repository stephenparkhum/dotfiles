return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			finder = {
				max_height = 0.8,
				left_width = 0.4,
				right_width = 0.4,
				keys = {
					toggle_or_open = "<CR>",
					quit = { "q", "<ESC>" },
					vsplit = "v",
					split = "s",
					tabe = "t",
				},
			},
			outline = {
				layout = "float",
				-- commented out because its all the default but i'll forget
				-- keys = {
				--   toggle_or_jump = 'o',
				--   quit = 'q',
				--   jump = 'e',
				-- },
			},
		})

		local map = vim.keymap.set
		-- Lsp finder find the symbol definition implement reference
		-- if there is no implement it will hide
		-- when you use action in finder like open vsplit then you can
		-- use <C-t> to jump back
		map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP finder", silent = true })

		-- Code action
		map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code action", silent = true })

		-- Rename
		-- map('n', 'gr', '<cmd>Lspsaga rename<CR>', { desc = 'LSP rename', silent = true })

		-- Peek Definition
		-- you can edit the definition file in this flaotwindow
		-- also support open/vsplit/etc operation check definition_action_keys
		-- support tagstack C-t jump back
		map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition", silent = true })

		-- Show line diagnostics
		map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

		-- Show cursor diagnostic
		map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

		-- Diagnsotic jump can use `<c-o>` to jump back
		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

		-- Trying out incoming/outgoing calls
		map("n", "gci", "<cmd>Lspsaga incoming_calls<CR>", { silent = true })
		map("n", "gco", "<cmd>Lspsaga outgoing_calls<CR>", { silent = true })

		-- Only jump to error
		map("n", "[e", function()
			require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true })
		map("n", "]e", function()
			require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true })

		-- Outline
		map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "LSP Outline", silent = true })

		-- Hover Doc
		-- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
