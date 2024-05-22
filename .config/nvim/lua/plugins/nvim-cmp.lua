-- LSP Autocomplete
return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    event = "InsertEnter",
    config = function()
        require "custom.cmp"
    end,
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path", -- source for file system paths in commands
        "hrsh7th/cmp-buffer",
        {
            "L3MON4D3/LuaSnip", -- snippet engine
            build = "make install_jsregexp"
        },
        "saadparwaiz1/cmp_luasnip",     -- for lua autocompletion
        "rafamadriz/friendly-snippets", -- useful snippet library
    },
}
