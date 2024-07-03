-- Telescope
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Telescope Setup
		local action_state = require("telescope.actions.state") -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
		local function filenameFirst(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
			return string.format("%s\t\t%s", tail, parent)
		end
		require("telescope").setup({
			defaults = {
				winblend = 0,
				layout_strategy = "vertical",
				dynamic_preview_title = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				path_display = filenameFirst,
				previewer = true,
				file_ignore_patterns = {
					"node_modules",
					"build",
					"coverage",
					"public",
				},
				prompt_prefix = "$ ",
				mappings = {
					i = {
						["<c-a>"] = function()
							print(vim.inspect(action_state.get_selected_entry()))
						end,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("scope")

		local builtin = require("telescope.builtin")

		local map = vim.keymap

		-- == TELESCOPE NAV == --
		map.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
		map.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>")
		map.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
		map.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
		map.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
		map.set("n", "<leader>cf", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>")
		map.set("n", "<leader>sg", function()
			vim.ui.input({ prompt = "Grep > " }, function(input)
				if input ~= nil then
					builtin.grep_string({ search = input })
				end
			end)
		end)
		map.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		map.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		local mappings = {}
		mappings.curr_buf = function()
			local opt = require("telescope.themes").get_dropdown({ height = 10, previewer = false })
			builtin.current_buffer_fuzzy_find(opt)
		end
		return mappings
	end,
}
