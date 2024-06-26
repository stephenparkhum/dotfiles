return {
    -- Common Dependencies
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        'nvim-lua/popup.nvim',
    },
    {
        'MunifTanjim/prettier.nvim',
        name = "prettier",
        config = function()
            local prettier = require('prettier')
            prettier.setup({
                bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
                filetypes = {
                    "css",
                    "graphql",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "json",
                    "less",
                    "markdown",
                    "scss",
                    "typescript",
                    "typescriptreact",
                    "yaml",
                },
            })
        end
    },
    {
        'MunifTanjim/eslint.nvim',
        name = "eslint",
    },
    'onsails/lspkind.nvim',
    --Smart Buffer
    { 'johann2357/nvim-smartbufs' },
    { 'MunifTanjim/prettier.nvim' },
    "axelvc/template-string.nvim",
    {
        "nvimtools/none-ls.nvim",
    },
    -- Grammar checking because I can't english
    { 'rhysd/vim-grammarous' },
    -- TODO Comments Highlighting
    { 'folke/todo-comments.nvim' },
    { 'numToStr/Comment.nvim',   opts = {} }, -- "gc" to comment visual lines/regions
    'tiagovla/scope.nvim',
    'airblade/vim-gitgutter',
    "tpope/vim-sleuth",
    -- Smart Comments
    'tpope/vim-commentary',
    'yorickpeterse/nvim-pqf',
    ------------------------ VIM TSX ------------------------
    -- by default, if you open tsx file, neovim does not show syntax colors
    { 'ianks/vim-tsx' },
    -- Fullstack Web Dev
    { 'pangloss/vim-javascript' },
    { 'mattn/emmet-vim' },
    'nvim-telescope/telescope-project.nvim',
    'debugloop/telescope-undo.nvim',
    'leafgarland/typescript-vim',

    --Vim Snippets
    { 'phux/vim-snippets' },
    { 'jeffkreeftmeijer/vim-numbertoggle' }, --Number Toggle -- toggles relative numbers on and off
    {                                        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
}
