local cmp = require('cmp')

cmp.setup({
   snippet = {
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
      end,
   },
   mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
      end,
      ['<S-Tab>'] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         else
            fallback()
         end
      end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
   }
})

-- -- Setup lspconfig.
-- require('lspconfig').tsserver.setup {
--    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {
   init_options = {
      hostInfo = "neovim"
   },
   cmd = { "typescript-language-server", "--stdio" },
   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
lspconfig.rust_analyzer.setup {
   -- Server-specific settings. See `:help lspconfig-setup`
   settings = {
      ['rust-analyzer'] = {},
   },
}

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
