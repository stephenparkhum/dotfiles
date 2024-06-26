-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function(_)
		require("nvim-treesitter.configs").setup(
			{
				event = { "BufReadPre", "BufNewFile" },
				ensure_installed = {
					"css",
					"devicetree",
					"html",
					"go",
					"javascript",
					"jsdoc",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"scss",
					"rust",
					"typescript",
					"tsx",
					"vim",
					"vimdoc",
				},
				sync_install = true,
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				modules = {},
				auto_install = true,
				indent = {
					enable = true,
				},
				highlight = {
					enable = true,
					use_languagetree = true,
				},
			}
		)
		require("treesitter-context").setup({
			enable = false,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		})
	end,
}
