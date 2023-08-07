local map = vim.keymap

-- Setup language servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {
   capabilities = capabilities,
   init_options = {
      hostInfo = "neovim"
   },
   cmd = { "typescript-language-server", "--stdio" },
   on_attach = function()
      -- map.set("n", "K", vim.lsp.buf.hover, {buffer=0})
      map.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
      map.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
      map.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
      map.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
      map.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
      map.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
      map.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
      map.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
   end,
   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
lspconfig.rust_analyzer.setup {
   -- Server-specific settings. See `:help lspconfig-setup`
   settings = {
      ['rust-analyzer'] = {},
   },
}

lspconfig.emmet_ls.setup({
   -- on_attach = on_attach,
   capabilities = capabilities,
   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
   init_options = {
      html = {
         options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
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
