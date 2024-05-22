local map = vim.keymap

local null_ls = require("null-ls")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(_, bfr)
  map.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  map.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  map.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  map.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  map.set("n", "gi", require("telescope.builtin").lsp_references, { buffer = 0 })
  map.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
  map.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
  map.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
  -- Add these later!
  -- ["<C-j>"] = {":move '>+1<CR>gv-gv", "Slide Text Up"},
  -- ["<C-k>"] = {":move '<-2<CR>gv-gv", "Slide Text Down"},
end

null_ls.setup({
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup('null_format', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      desc = 'Fix and format',
      callback = function()
        vim.cmd('EslintFixAll')
        vim.lsp.buf.format({ id = client.id })
      end
    })
  end,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
    })
  }
})

-- Setup language servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
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

nvim_lsp.solidity_ls_nomicfoundation.setup {}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.eslint.setup({
  settings = {
    packageManager = "npm"
  }
})

-- LSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values

-- Global LSP mappings.
map.set('n', '<leader>e', vim.diagnostic.open_float)
map.set('n', '<leader>q', vim.diagnostic.setloclist)
-- map.set('n', '[d', vim.diagnostic.goto_prev)
-- map.set('n', ']d', vim.diagnostic.goto_next)
map.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map.set('n', 'H', ':lua vim.lsp.buf.hover()<CR>')
map.set('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>')
map.set('n', 'rn', ':lua vim.lsp.buf.rename()<CR>')
