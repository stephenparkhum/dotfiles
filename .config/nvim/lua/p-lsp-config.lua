local map = vim.keymap

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- local eslint = {
--     lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--     lintStdin = true,
--     lintFormats = { "%f:%l:%c: %m" },
--     lintIgnoreExitCode = true,
--     formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--     formatStdin = true
-- }


local on_attach = function(_, bfr)
  map.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  map.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  map.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  map.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  map.set("n", "gi", require("telescope.builtin").lsp_references, { buffer = 0 })
  map.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
  map.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
  map.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
end

-- Setup language servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach()
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    hostInfo = "neovim",
    preferences = {
      importModuleSpecifierPreference = 'project=relative',
      jsxAttributeCompletionStyle = 'none'
    }
  },
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

nvim_lsp.eslint.setup({
  settings = {
    packageManager = "npm"
  }
})

nvim_lsp.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

-- LSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values

-- Global LSP mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'H', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'rn', ':lua vim.lsp.buf.rename()<CR>')
