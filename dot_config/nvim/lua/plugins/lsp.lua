-- LSP Config
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "harper_ls" },
			})
		end,
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"j-hui/fidget.nvim",
		},
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local map = vim.keymap.set

			map("n", "H", vim.lsp.buf.hover, {})
			map("n", "<leader>gd", vim.lsp.buf.definition, {})
			map("n", "<leader>gi", vim.lsp.buf.implementation, {})
			map("n", "<leader>gr", vim.lsp.buf.references, {})

			local lspconfig = require("lspconfig")

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.shopify_theme_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.harper_ls.setup({
				capabilities = capabilities,
				settings = {
					["harper-ls"] = {
						linters = {
							spell_check = true,
							spelled_numbers = false,
							sentence_capitalization = false,
							long_sentences = true,
							repeated_words = false,
							spaces = true,
							matcher = true,
							correct_number_suffix = true,
							number_suffix_capitalization = false,
							multiple_sequential_pronouns = true,
							linking_verbs = false,
							avoid_curses = false,
							terminating_conjunctions = false,
						},
					},
				},
			})

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
