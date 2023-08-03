-- require("nvim-treesitter.configs").setup { highlight = { enable = true } }

local map = vim.keymap

-- Native LSP Setup
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'
lspconfig.tsserver.setup {
  capabilities = capabilities,
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
} -- connect to server

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

local configs = require('lspconfig/configs')

-- LSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values

-- Setup nvim-cmp.
local cmp = require 'cmp'

-- This next line brings in auto-pairs to the completion workflow
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local mappings = {

}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({ height = 10, previewer = false })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
