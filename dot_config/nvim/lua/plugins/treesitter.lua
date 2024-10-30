-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function(_)
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"css",
				"devicetree",
				"html",
				"javascript",
				"typescript",
				"jsdoc",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"scss",
				"rust",
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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["a="] = { query = "@assignment.outer", desc = "Select outter part of an assignement" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignement" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand part of an assignement" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand part of an assignement" },

						["al"] = { query = "@loop.outer", desc = "Select outter part of an loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of an loop" },

						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						-- You can also use captures from other query groups like `locals.scm`
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = true,
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.inner", desc = "Next loop start" },

						["[f"] = { query = "@call.inner", desc = "Next function call start" },
						["[m"] = { query = "@function.inner", desc = "Next method/function def start" },
						["[c"] = { query = "@class.inner", desc = "Next class start" },
						["[i"] = { query = "@conditional.inner", desc = "Next conditional start" },
						["[l"] = { query = "@loop.inner", desc = "Next loop start" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner",
						["<leader>nm"] = "@function.outer",
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.outer",
						["<leader>pm"] = "@function.outer",
					},
				},
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
		})
		require("treesitter-context").setup({
			enable = true,
			max_lines = 1,
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
