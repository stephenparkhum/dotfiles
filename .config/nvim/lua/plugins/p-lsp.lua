local map = vim.keymap

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)


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
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      }
    },
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
map.set('n', '<leader>e', vim.diagnostic.open_float)
map.set('n', '[d', vim.diagnostic.goto_prev)
map.set('n', ']d', vim.diagnostic.goto_next)
map.set('n', '<leader>q', vim.diagnostic.setloclist)
map.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map.set('n', 'H', ':lua vim.lsp.buf.hover()<CR>')
map.set('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>')
map.set('n', 'rn', ':lua vim.lsp.buf.rename()<CR>')
