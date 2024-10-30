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
			ui = {
				devicon = true,
			},
			lightbulb = {
				enable = false,
			},
			outline = {
				layout = "float",
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
		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "LSP Rename", silent = true })

		-- Peek Definition
		-- you can edit the definition file in this float window
		-- also support open/vsplit/etc operation check definition_action_keys
		map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition", silent = true })

		-- Show line diagnostics
		map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "[L]ine [Diag]", silent = true })

		-- Show buffer diagnostics
		map("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "[B]uff [Diag]", silent = true })

		-- Show workspace diagnostics
		map(
			"n",
			"<leader>wd",
			"<cmd>Lspsaga show_workspace_diagnostics<CR>",
			{ desc = "[W]orksp [Diag]", silent = true }
		)

		-- Diagnostic jump can use `<c-o>` to jump back
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
		map("n", "H", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
