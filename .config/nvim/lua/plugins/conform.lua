return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat Buffer"
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
        lsp_fallback = vim.bo[bufnr].filetype,
      }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      css = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      rust = { { "prettierd", "prettier" } },
    },
  },
}
