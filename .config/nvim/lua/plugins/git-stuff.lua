return {
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				delay = 1000,
				enabled = true,
				message_template = "<committer> • <date> • <sha>",
				message_when_not_committed = "nah",
			})

			vim.keymap.set("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle git blame" })
			vim.keymap.set("n", "<leader>gof", "<CMD>GitBlameOpenFileURL<CR>", { desc = "Open file in GitHub" })
			vim.keymap.set(
				"n",
				"<leader>goc",
				"<CMD>GitBlameOpenCommitURL<CR>",
				{ desc = "Open commit of current line in GitHub" }
			)
			vim.keymap.set("n", "<leader>gcf", "<CMD>GitBlameCopyFileURL<CR>", { desc = "Copy github url of file" })
			vim.keymap.set(
				"n",
				"<leader>gcc",
				"<CMD>GitBlameCopyCommitURL<CR>",
				{ desc = "Copy github url of current line's commit" }
			)
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
