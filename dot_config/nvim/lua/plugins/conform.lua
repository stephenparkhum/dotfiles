return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat Buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			css = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
}
