---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

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
			markdown = function(bufnr)
				return { first(bufnr, "prettierd", "prettier"), "injected" }
			end,
			python = { "isort", "black" },
			css = function(bufnr)
				return { first(bufnr, "prettierd", "prettier"), "injected" }
			end,
			javascript = function(bufnr)
				return { first(bufnr, "prettierd", "prettier"), "injected" }
			end,
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
}
